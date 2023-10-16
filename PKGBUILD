pkgname=pear-merger
_pkgname=pear
pkgver=0.9.11
pkgrel=1
pkgdesc="Fast and accurate Illumina Paired-End reAd mergeR"
arch=('x86_64' 'i686')
url="https://github.com/ressy/pear"
license=('CCPL')
makedepends=("git")
conflicts=("pear-merger-git")
replaces=("pear-merger-git")
source=(
    "https://codeload.github.com/ressy/${_pkgname}/tar.gz/refs/tags/v${pkgver}"
    "no-static.patch"
)
sha512sums=(
    "48009ec961a57e99eb35bddaa545644cf563804c93b235ec6acf64f62fde590366e6c4360773456742d22dfa54a559ae84dc1bda8bf34e09614abb9897e903cb"
    "SKIP"
)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../no-static.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
