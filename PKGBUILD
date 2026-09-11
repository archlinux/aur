# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=keyring-aliveos
pkgver=0.1.0
pkgrel=1
pkgdesc="Transparent GNOME Keyring / Secret Service prompter for AliveOS with Zenity-GTK3 styling, UAC screen dimming, and password reveal"
arch=('any')
url="https://github.com/Twilight0/keyring-aliveos"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'gcr' 'libcanberra')
source=("https://github.com/Twilight0/keyring-aliveos/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b3ef77242a659c0d39070adc0e52e3459690541bbe4c0f37b1bb16c77b957bac')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install prompter executable
  install -Dm755 keyring-aliveos "${pkgdir}/usr/lib/keyring-aliveos/keyring-aliveos"

  # Symlink prompter binary into /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/lib/keyring-aliveos/keyring-aliveos "${pkgdir}/usr/bin/keyring-aliveos"

  # Install D-Bus service activation files
  install -Dm644 data/org.gnome.keyring.SystemPrompter.service \
    "${pkgdir}/usr/share/dbus-1/services/org.gnome.keyring.SystemPrompter.service"
  install -Dm644 data/org.gnome.keyring.PrivatePrompter.service \
    "${pkgdir}/usr/share/dbus-1/services/org.gnome.keyring.PrivatePrompter.service"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
