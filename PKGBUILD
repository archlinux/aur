# Maintainer  : Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : GI_Jack <GI_Jack@hackermail.com>


pkgname=karma-git
_pkgname=karma

epoch=1
pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
pkgver=v1.0.0.r23.7cddd82
pkgrel=1

pkgdesc='Search of Emails and Passwords on Pwndb'
arch=('any')
url="https://github.com/decoxviii/karma"
license=('MIT')

makedepends=('git')
depends=('python-docopt' 'python-requests' 'python-pysocks' 'python-texttable')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+$url.git")
sha256sums=('SKIP')


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
