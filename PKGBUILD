# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: John K. Luebs <https://github.com/jkl1337>

pkgname=zasm
pkgver=4.0.17
pkgrel=1
pkgdesc="A 2-pass assembler for the Zilog 8-bit Z80 CPU"
arch=('any')
url="http://k1.spdns.de/Develop/Projects/zasm/"
license=('BSD')
source=("zasm.tar.gz::https://k1.spdns.de/Git/zasm-4.0.git/snapshot/zasm-4.0-bc345236210d0a2a0bb0415e08968efca881617d.tar.gz",
        "libraries.tar.gz::http://k1.spdns.de/Git/Libraries.git/snapshot/Libraries-1c6fea1a5538dfaf1ece20a53db50de00897b6f0.tar.gz")
sha256sums=('f451e43ca725d10f1c1d6b47480df4b5dfb06f81ad123d9c68637351f00ed45c'
            'ede9c539873d21f65da27849d28ea81ea39ea897947b66aff1f2710c3cec52f9')

build() {
  cd ${srcdir}
  if [ -d Libraries ]; then
    rm -rf Libraries
  fi
  mv Libraries-1c6fea1a5538dfaf1ece20a53db50de00897b6f0 Libraries
  if [ -d ${pkgname} ]; then
    rm -rf ${pkgname}
  fi
  mv zasm-4.0-bc345236210d0a2a0bb0415e08968efca881617d ${pkgname}
  cd ${pkgname}
  rm Libraries
  ln -s ../Libraries Libraries
  cd Linux

  make
}

package() {
  cd ${srcdir}/${pkgname}/Linux

  install -Dm755 zasm "${pkgdir}/usr/bin/zasm"
}
