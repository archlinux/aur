# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Gordin <gordin@koeln.ccc.de>

pkgname=wit
pkgver=3.03a
pkgrel=1
pkgdesc='Wiimms ISO Tools'
arch=(x86_64)
url=https://wit.wiimm.de
license=(GPL2)
depends=(
  bzip2
  fuse2
  glibc
  libncursesw.so
  zlib
)
makedepends=(
  clang
  git
)
optdepends=(
  'bash: Update titles lists'
  'wget: Update titles lists'
)
install=wit.install
_commit=fb217fb75b4f449dd00ecbeeae7a35082e87218c
source=(
  git+https://github.com/Wiimm/wiimms-iso-tools.git#commit=${_commit}
  wit-makefile.patch
  wit-no-exec-stack.patch
  wit-titles.patch
)
b2sums=('SKIP'
        '2440f01dc499477b9c237d2bc6d9a6a712ac22887df022b6a84c6ec6ac9b095aa5944db6c5af9773a2e2446df6cc7774783c8cfd59ed815d9cb413ae8e1c0efb'
        'a9e615aac8ebafcf98079160f3e2140e1389e42baf7896a2fd845133e47ebcea9199eef847b84732d4dc4fec6107f45e96fb4ab3d4acf5421c88e02f3564eb62'
        '4e241a0c37fd2a082d4285d3685833e3805e35db829961183df02bb426d5679b62f8985f59604512b2615002faa28a9d8947ca9c6fc86a025bee5ab7bbf1bcf7')

prepare() {
  cd wiimms-iso-tools

  patch -Np1 -i ../wit-makefile.patch
  patch -Np1 -i ../wit-no-exec-stack.patch
  patch -Np1 -i ../wit-titles.patch
}

build() {
  make INSTALL_PATH="${pkgdir}/usr" CC=clang -C wiimms-iso-tools/project tools
  make INSTALL_PATH="${pkgdir}/usr" CC=clang -C wiimms-iso-tools/project doc
}

package () {
  make INSTALL_PATH="${pkgdir}/usr" CC=clang -C wiimms-iso-tools/project install
  install -Dm 644 wiimms-iso-tools/project/doc/*.txt -t "${pkgdir}"/usr/share/doc/wit/
}

# vim: ts=2 sw=2 et:
