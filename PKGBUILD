# Maintainer: Notify-ctrl <notify-ctrl@qq.com>

pkgname=freekill
_upper_pkgname=FreeKill
pkgver=0.0.2
pkgrel=1
arch=('x86_64')
url='https://github.com/Notify-ctrl/FreeKill'
license=('GPL3')
pkgdesc='A Bang-like card game'
depends=('qt6-declarative' 'qt6-multimedia' 'qt6-5compat'
  'qt6-shadertools' 'libgit2' 'lua' 'sqlite' 'openssl'
  'readline' )
makedepends=('cmake' 'flex' 'bison' 'qt6-tools' 'swig' 'clang')
source=("${url}/releases/download/v${pkgver}/FreeKill-${pkgver}-source.tar.gz")
sha256sums=('56b2f04993b2824d68130e8068d5e6190ccf9e452fc48b13365eaab4de587a86')

prepare() {
  cd ${srcdir}/${_upper_pkgname}-${pkgver}
  rm -rf build
}

build() {
  cd ${srcdir}/${_upper_pkgname}-${pkgver}
  mkdir build && cd build
  cmake ..
  make
}

package() {
  mkdir -p ${pkgdir}/usr/share/${_upper_pkgname}
  mkdir -p ${pkgdir}/usr/share/icons
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib
  cd ${srcdir}/${_upper_pkgname}-${pkgver}
  cmake --install build --prefix ${pkgdir}/usr --config Release

  cp -r audio fonts image lua packages qml server build/zh_CN.qm \
    ${pkgdir}/usr/share/${_upper_pkgname}
  install -Dm644 image/icon.png ${pkgdir}/usr/share/icons/freekill_logo.png
  install -Dm644 freekill.desktop ${pkgdir}/usr/share/applications/freekill.desktop
}
