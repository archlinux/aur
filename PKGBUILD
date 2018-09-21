# Maintainer: Janek Thomaschewski <janek@jbbr.net>
# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=signal-desktop-bin
pkgver=1.16.2
pkgrel=1
pkgdesc='Private messaging from your desktop'
arch=('x86_64')
url='https://github.com/signalapp/Signal-Desktop'
license=('GPL3')
provides=('signal-desktop')
conflicts=('signal')
options=('!strip')
depends=('gconf' 'gtk3' 'libnotify' 'nss' 'xdg-utils' 'libxss')
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${pkgver}_amd64.deb"
        'signal-desktop')
sha256sums=('7ec0e5ad80135b60a8fb7bce37f5182dff637b5e6453e85184b95ec4744127c8'
            '69be405397369ba47d1df61271efef72c1cf3af417d8a5c4dec1bbeb2cca084e')

package() {
  # extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # fix permissions in 1.9.0+ (Some directories have now 775; changing them back to 755)
  find "${pkgdir}" -type d -not -perm 755 -exec chmod 755 {} \;

  # install alias in /usr/bin
  mkdir "${pkgdir}/usr/bin"
  install -D -m755 signal-desktop "${pkgdir}/usr/bin/signal-desktop"
}
