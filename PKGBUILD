# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
pkgname=zuo-git
pkgver=r14.ea42b63
pkgrel=1
pkgdesc="A tiny Racket for scripting."
arch=('x86_64')
url="https://github.com/racket/zuo"
license=('Apache' 'MIT')
makedepends=('git')
provides=('zuo')
source=("zuo::git+https://github.com/racket/zuo")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf r%s.%s \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname%-git}"
  make -k check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/"
  install -Dm644 \
    {,"$pkgdir/usr/share/licenses/${pkgname%-git}/"}LICENSE.txt
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
