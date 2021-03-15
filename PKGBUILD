# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ausweisapp2
pkgver=1.22.1
pkgrel=1
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/"
depends=('qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-websockets' 'pcsclite' 'http-parser')
makedepends=('cmake' 'qt5-tools')
optdepends=('ccid' 'acsccid' 'pcsc-cyberjack')
source=("https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp2-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('c96f49fb9b1fe4970155c6d9da0e924bb026bc624dc579843e3dd30427012626'
            'SKIP')

prepare() {
  cd "AusweisApp2-$pkgver"
}

build() {
  cd "${srcdir}"
  cmake -B build -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/AusweisApp2-${pkgver}"
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/AusweisApp2-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
