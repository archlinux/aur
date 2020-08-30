# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=getmail6-git
_pkgname="${pkgname%-git}"

epoch=1
pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/^v//;s/-/.r/;s/-g/./'
}
pkgver=6.6.r2.7a48905
pkgrel=1

pkgdesc='POP3 mail retriever with reliable Maildir and command delivery; Python 3 port'
arch=('any')
url="http://$_pkgname.org"
license=('GPL2')

provides=("getmail=$pkgver" "${pkgname%-git}")
conflicts=('getmail')

makedepends=('git')
depends=('python-chardet')

changelog=CHANGELOG
source=("git+https://github.com/$_pkgname/$_pkgname.git")
b2sums=('SKIP')


build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
