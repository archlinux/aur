# Maintainer: A. Klitzing <aklitzing@gmail.com>

pkgname=ausweisapp2
pkgver=2.4.0
pkgrel=1
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64' 'aarch64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/"
depends=('qt6-declarative' 'qt6-svg' 'qt6-websockets' 'qt6-scxml' 'pcsclite' 'http-parser')
makedepends=('cmake' 'qt6-tools' 'ninja' 'pkgconf')
optdepends=('ccid' 'acsccid' 'pcsc-cyberjack')
source=("https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('cd748510c4f6f3782d18c76d0661322dd78a7f5021ff60d122163a3a961850e3'
            'SKIP')

prepare() {
  cd "AusweisApp-$pkgver"
}

build() {
  cd "${srcdir}"
  cmake -GNinja -B build -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/AusweisApp-${pkgver}"
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/AusweisApp-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
