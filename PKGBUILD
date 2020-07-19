# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=getmail6

pkgver() {
  cd "$pkgname"
  printf '%s.r%s' \
    "$(grep ^Version PKG-INFO | sed 's/.\+: \?//')" \
    "$(git rev-list --count HEAD)"
}
pkgver=6.00.r326
pkgrel=1

pkgdesc='POP3 mail retriever with reliable Maildir and command delivery; Python 3 port'
arch=('any')
url="https://github.com/$pkgname/$pkgname"
license=('GPL2')

provides=("getmail=$pkgver")
conflicts=('getmail')

makedepends=('git')
depends=('python-chardet')

changelog=CHANGELOG
source=("git+$url.git#commit=bb4e959ebeea78ddc1569c8397f5aca7e1166e35")
b2sums=('SKIP')


build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
