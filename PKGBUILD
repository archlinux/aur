# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=polkit-aliveos
pkgver=0.1.0
pkgrel=1
pkgdesc="Transparent Polkit authentication agent for AliveOS with explicit caller disclosure, UAC screen dimming, and Zenity-GTK3 styling"
arch=('any')
url="https://github.com/Twilight0/polkit-aliveos"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'polkit' 'libcanberra')
provides=('polkit-authentication-agent')
conflicts=('polkit-gnome')
source=("https://github.com/Twilight0/polkit-aliveos/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a8843e8aad623b0a029766ffcd593e3d887072cbf33728eb714a905004775d1')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install authentication agent
  install -Dm755 polkit-aliveos "${pkgdir}/usr/lib/polkit-aliveos/polkit-aliveos"

  # Install configuration companion utilities (GTK and Curses TUI)
  install -Dm755 polkit-aliveos-config "${pkgdir}/usr/bin/polkit-aliveos-config"
  install -Dm755 qpolkitconfig "${pkgdir}/usr/bin/qpolkitconfig"

  # Symlink agent binary into /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/lib/polkit-aliveos/polkit-aliveos "${pkgdir}/usr/bin/polkit-aliveos"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
