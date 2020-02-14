# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=molblocks
pkgver=0.1
pkgrel=1
pkgdesc="A suite to break small molecules into chemically meaningful fragments"
url="https://compbio.cs.princeton.edu/molblocks/"
license=("GPL3")
arch=(x86_64)
depends=(openbabel2)
makedepends=(gcc patch make)
source=("https://compbio.cs.princeton.edu/molblocks/molblocks.tar.gz"
        "fix_linking.patch")
sha1sums=('f9cf416d89a282e6dd75a114faef9aa822ded6a6'
          'ef8909111347af97ef4c70e296f6d881fbb2a892')

prepare() {
  cd "${srcdir}/molblocks"

  patch -Np0 -i "${srcdir}/fix_linking.patch"
}

build() {
  cd "${srcdir}/molblocks"

  make
}


package() {
  cd "${srcdir}/molblocks"

  # create directories
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/molblocks"

  # install binaries
  install -Dm755 "${srcdir}/molblocks/analyze" "${pkgdir}/usr/bin/mb-analyze"
  install -Dm755 "${srcdir}/molblocks/fragment" "${pkgdir}/usr/bin/mb-fragment"

  # install data
  cp -r "${srcdir}/molblocks/exampleAntiNeopl" "${pkgdir}/usr/share/molblocks/"
  cp -r "${srcdir}/molblocks/exampleCephalosp" "${pkgdir}/usr/share/molblocks/"
  install -Dm644 "${srcdir}/molblocks/BRICS.txt" "${pkgdir}/usr/share/molblocks/BRICS.txt"
  install -Dm644 "${srcdir}/molblocks/CCQ.txt" "${pkgdir}/usr/share/molblocks/CCQ.txt"
  install -Dm644 "${srcdir}/molblocks/RECAP.txt" "${pkgdir}/usr/share/molblocks/RECAP.txt"
}
