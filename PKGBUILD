# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="truepolyglot"
pkgdesc="Create polyglot files that are valid PDF and ZIP at the same time. See POC||GTFO 07."

pkgver=1.6.2
pkgrel=4

arch=("any")
url="https://github.com/ansemjo/$pkgname"
license=("UNLICENSE")

depends=("python" "python-pypdf2")
makedepends=("python-setuptools")

provides=($pkgname)
conflicts=($pkgname)

# temporary patch until setup.py is merged upstream
commit="3940758a9e70c9670865e307b015216c3383c63a"
source=("${url}/archive/${commit}.tar.gz")

#source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("fa5018eedef9831a039116845df6e2b20be8e71992e12e56def02d87ff27be69")

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
