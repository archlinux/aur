# Maintainer: A. Klitzing <aklitzing@gmail.com>

pkgname=ausweisapp2
pkgver=1.26.4
pkgrel=1
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64' 'aarch64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/"
depends=('qt6-declarative' 'qt6-svg' 'qt6-websockets' 'qt6-scxml' 'pcsclite' 'http-parser')
makedepends=('cmake' 'qt6-tools' 'qt6-shadertools' 'ninja')
optdepends=('ccid' 'acsccid' 'pcsc-cyberjack')
source=("https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp2-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('5657da259e7554b3c6e44af34349acfc5d433232f0a36df5eecbe02b9fd6bd04'
            'SKIP')

prepare() {
  cd "AusweisApp2-$pkgver"
}

build() {
  cd "${srcdir}"
  cmake -GNinja -B build -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/AusweisApp2-${pkgver}"
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/AusweisApp2-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
