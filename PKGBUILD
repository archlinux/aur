# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="truepolyglot"
pkgdesc="Create polyglot files that are valid PDF and ZIP at the same time. See POC||GTFO 07."

pkgver=1.6.2
pkgrel=5

arch=("any")
url="https://github.com/ansemjo/$pkgname"
license=("UNLICENSE")

depends=("python" "python-pypdf2")
makedepends=("python-setuptools")

provides=($pkgname)
conflicts=($pkgname)

# use specific commit because setup.py isn't merged upstream
commit="3940758a9e70c9670865e307b015216c3383c63a"
source=("${url}/archive/${commit}.tar.gz")
sha256sums=("2067dbde27ded1932aec60d8f59aa49f09d0c38866a535524738b1b9260731a0")

build() {
  #cd "${pkgname}-${pkgver}"
  cd "${pkgname}-${commit}"
  python ./setup.py build
}

package() {
  #cd "${pkgname}-${pkgver}"
  cd "${pkgname}-${commit}"
  python ./setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -v -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
