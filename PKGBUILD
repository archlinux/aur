# Maintainer:  Tianhao Wang <i AT shrik3 DOT com>

pkgname=bilibili-magical-danmaku
pkgver=4.10.7
pkgrel=2
pkgdesc="bilibili神奇弹幕,整合弹幕姬+答谢姬+点歌姬+回复姬+工作流"
_pkgname=Bilibili-MagicalDanmaku
_bin=Bilibili-MagicalDanmaku
_pkgsrc=${_pkgname}-${pkgver}
arch=($CARCH)
license=('GPL-3.0-only')
url="https://github.com/iwxyi/Bilibili-MagicalDanmaku"
depends=(
  'qt5-base>=5.15'
  'qt5-multimedia'
  'qt5-speech'
  'qt5-websockets'
  'zlib'
  'gcc-libs'
  'glibc'
)

makedepends=(
  'git'
)


source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/iwxyi/Bilibili-MagicalDanmaku/archive/refs/tags/v${pkgver}.tar.gz"
    "0001-fix-build-explicitly-include-QPainterPath.patch"
    "0002-fix-build-remove-reference-to-missing-file.patch"
)

sha256sums=(
    'd547ca405f728874a03b0ee77c803ab8b9bed72a6bf55adc7a95ad201e44658b'
    'SKIP'
    'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 <${srcdir}/0001-fix-build-explicitly-include-QPainterPath.patch
  patch -p1 <${srcdir}/0002-fix-build-remove-reference-to-missing-file.patch
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p build
  cd build
  qmake ..
  make
}


package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dvm755 -T "build/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  install -Dvm644 -T LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
