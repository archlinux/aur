# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


_pkgname=getmail
pkgname="$_pkgname-python3-git"

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.%s' \
    "$(grep ^Version PKG-INFO | sed 's/.\+: \?//')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}
pkgver=6.00.r21.b25297b
pkgrel=1

pkgdesc='POP3 mail retriever with reliable Maildir and command delivery; Python 3 port'
arch=('any')
url="https://github.com/rpuntaie/$_pkgname"
license=('GPL2')

provides=("$_pkgname" "$_pkgname-python3")
conflicts=("$_pkgname" "$_pkgname-python3")

makedepends=('git')
depends=('python-chardet')

changelog=CHANGELOG
source=("git+$url.git")
sha256sums=('SKIP')


build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
