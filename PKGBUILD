# Maintainer: Emmanuel Villavizar Trinidad <evillavizartrinidad@gmail.com>

pkgname=xdg-xmenu-git
pkgver=r21.3d19f4d
pkgrel=1
pkgdesc="Small shell script to generate xdg desktop menu file for xmenu."
url="https://github.com/OliverLew/xdg-xmenu"
arch=('x86_64')
license=('MIT')
depends=('xmenu' 'librsvg' 'imagemagick')
source=("git+$url")
install="${pkgname}.install"
sha256sums=("SKIP")
makedepends=('git')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  install -m755 -D xmenu-apps "$pkgdir/usr/share/doc/${pkgname%-git}/xmenu-apps"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

