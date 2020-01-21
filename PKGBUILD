# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-twitter-git
pkgdesc="A Python wrapper around the Twitter API"
url="https://github.com/bear/python-twitter"

provides=('python-twitter')
conflicts=('python-twitter')

pkgver=3.99.r1048.a1fe9c8
_pkgver=3.99
pkgrel=1

arch=(any)
license=('Apache')

depends=(
    "python-requests-oauthlib"
    "python-future"
)
makedepends=(
    "git"
    "python-setuptools"
)

source=("${pkgname}::git://github.com/bear/python-twitter.git")
md5sums=('SKIP')

pkgver(){
  cd "${pkgname}"
  printf "%s.r%s" "$_pkgver" "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
