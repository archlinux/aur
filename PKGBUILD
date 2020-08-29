# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=getmail6-git
_pkgname="${pkgname%-git}"

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.%s' \
    "$(git describe --tags | sed 's/^v\(.\+\)/\1/')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}
pkgver=6.6.r393.86448a3
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
