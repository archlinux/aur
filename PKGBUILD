# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-html-encode
_pkgname="${pkgname#cl-}"
pkgver=1.2
pkgrel=1
pkgdesc='A small library for encoding text in various web-savvy formats'
arch=('any')
url='https://cliki.net/html-encode'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
# source grabbed from quicklisp's archive because upstream is gone
source=("$pkgname-$pkgver.tar.gz::https://beta.quicklisp.org/archive/html-encode/2010-10-06/html-encode-1.2.tgz")
b2sums=('98df171e0def56c0d52b2837ee43dc89a61365c6fbfbba6ed2e521e356d2b15bd4c45e72afdc2118512d205db38f3adb7857f238deca61ff375c9df0e9450ea9')

package() {
  cd "$_pkgname-$pkgver"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
