# Maintainer  : Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : GI_Jack <GI_Jack@hackermail.com>


pkgname=karma-git
_pkgname=karma

epoch=1
pkgver() { git -C "$_pkgname" describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=1.0.0.r23.7cddd82
pkgrel=1

pkgdesc='Search of Emails and Passwords on Pwndb'
arch=('any')
url="https://github.com/decoxviii/$_pkgname"
license=('MIT')

makedepends=('git')
depends=('python-docopt' 'python-requests' 'python-pysocks' 'python-texttable')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
  cd "$_pkgname"
  sed -i 's/\(karma\)\.py/\1/g' "bin/$_pkgname"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install -O1 --skip-build --root="$pkgdir"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/$_pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
