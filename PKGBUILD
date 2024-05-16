# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>

_pkgname=zuo
pkgname="$_pkgname-git"
pkgver=r71.8a66ab8
pkgrel=1
pkgdesc="A tiny Racket for scripting."
arch=('x86_64')
url="https://github.com/racket/zuo"
license=('Apache' 'MIT')
makedepends=('git')
provides=('zuo')
conflicts=('zuo')
source=("zuo::git+https://github.com/racket/zuo")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf r%s.%s \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname"
  make -k check
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE.txt
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
