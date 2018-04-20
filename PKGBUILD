# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Eric Biggers <ebiggers3@gmail.com>

pkgname=dwgsim
pkgver=0.1.12
pkgrel=1
pkgdesc="Whole genome read simulator for Next-Generation Sequencing data"
arch=('x86_64')
url=https://github.com/nh13/DWGSIM/wiki
license=('GPL2')
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://github.com/nh13/DWGSIM/archive/"${pkgname}"."${pkgver}".tar.gz
  git+https://github.com/samtools/samtools.git#commit=28391e5898804ce6b805016d8c676fdf61442eb3
)
sha256sums=(
  '230abcbc7e437dcfbb6a66a6639baa4e6d75d5186caa93fd3ee8743a824637e7'
  'SKIP'
)

prepare() {
  # Remove empty left-over submodule dir from the release and fill link in
  # the right dependency git repository.
  cd "${srcdir}"/DWGSIM-"${pkgname}"."${pkgver}"
  rm -rf samtools && ln -s ../samtools samtools
}

build() {
  cd "${srcdir}"/DWGSIM-"${pkgname}"."${pkgver}"
  make
}

package() {
  cd "${srcdir}"/DWGSIM-"${pkgname}"."${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/doc/"${pkgname}"/LICENSE
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
}
