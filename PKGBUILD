# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="truepolyglot"
pkgdesc="Create polyglot files that are valid PDF and ZIP at the same time. See POC||GTFO 07."

pkgver=1.6.2
pkgrel=2

arch=("any")
url="https://github.com/ansemjo/$pkgname"
license=("UNLICENSE")

depends=("python")
makedepends=("python-setuptools")

provides=($pkgname)
conflicts=($pkgname)

# temporary patch until setup.py is merged upstream
commit="de76ac3bb1d9a3fc5c5009d1059f7bcd21355c00"
source=("${url}/archive/${commit}.tar.gz")

#source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("eb8a392b0e401eb41fca8a3061afb7d7d05f9a1615715178dd1d48e756b0022c")

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
