# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=fbpdf-poppler-git
pkgver=r101.ba231d2
pkgrel=2
pkgdesc="A small framebuffer pdf and djvu viewer (only poppler backend)"
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('BSD')
depends=('poppler' 'djvulibre')
makedepends=('git')
provides=('fbpdf' 'fbpdf-git')
conflicts=('fbpdf' 'fbpdf-git')
source=("$pkgname::git+https://github.com/aligrudi/fbpdf.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make fbpdf2 fbdjvu
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 fbpdf2 $pkgdir/usr/bin/fbpdf2
  install -Dm755 fbdjvu $pkgdir/usr/bin/fbdjvu
  install -Dm644 fbpdf.1 $pkgdir/usr/share/man/man1/fbpdf.1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
