# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ricky Sheaves <ricky[at]westdowneast[dot]com>

pkgname=mudita24-git
pkgver=r16.e38b1a3
pkgrel=1
pkgdesc="Improved Control Panel for Ice1712 Audio Cards"
arch=(i686 x86_64)
url="https://github.com/NielsMayer/mudita24"
license=(GPL2)
depends=(alsa-lib gtk2)
makedepends=(git cmake)
source=("git+https://github.com/NielsMayer/mudita24"
	      mudita24.desktop
	      mudita24.png)
sha256sums=('SKIP'
            '4fdfcf2d92ee0424fa2af5e06cf21fb07ac5bc9938db224a38a4687cb5c44637'
            'a659ff56346e3d11bd0c386efd55b183c5e07c9ae8e03e5de15caf6c1be09513')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}/${pkgname%-git}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${pkgname%-git}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/mudita24.desktop" "${pkgdir}/usr/share/applications/mudita24.desktop"
  install -D -m644 "${srcdir}/mudita24.png"     "${pkgdir}/usr/share/pixmaps/mudita24.png"
  
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/mudita24/COPYING"
}
