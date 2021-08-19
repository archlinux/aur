# Maintainer: Emmanuel Villavizar Trinidad <evillavizartrinidad@gmail.com>

pkgname=xdg-xmenu-git
pkgver=r12.07a4193
pkgrel=1
pkgdesc="Runs a command every time a given mouse button is pressed on the root window."
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
  install -m644 -D LICENSE "$pkgdir/usr/share/doc/${pkgname%-git}/LICENSE"
  install -m755 -D xmenu-apps "$pkgdir/usr/share/doc/${pkgname%-git}/xmenu-apps"
}

