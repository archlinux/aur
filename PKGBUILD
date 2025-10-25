# Maintainer: Andrey Balabanov <wingtip-ripest-0y at icloud dot com>

pkgname=daduda
pkgver=1.0.0
pkgrel=3
pkgdesc='Cross-platform-avrdude-GUI'
arch=('x86_64')
url="https://github.com/AndrejChoo/Cross-platform-avrdude-GUI/tree/v${pkgver}"
license=('GPL-2.0-only')
depends=(
  'avrdude'
  'qt6-base'
  'qt6-serialport'
)
makedepends=(
  'git'
  'qt6-tools'
  'qt6-serialport'
)
source=("git+https://github.com/AndrejChoo/Cross-platform-avrdude-GUI"
	"daduda.desktop"
	"daduda.png")
sha256sums=('SKIP'
            'e3ebc64ba1c88f86460f5f98848177e5e2a4c430f1953d6da922e9fcc5d7ada1'
            '17447fc3a1479850a5d8f9a06dab98fce129189afc1fb31ecda6a90da244ab04')

build() {
  cd Cross-platform-avrdude-GUI/source
  qmake6 \
    PREFIX="${pkgdir}/usr" \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  cd Cross-platform-avrdude-GUI/source
  make INSTALL_ROOT=${pkgdir} install
  install -Dm755 "${srcdir}/daduda.desktop" "$pkgdir/usr/share/applications/daduda.desktop"
  install -Dm644 "${srcdir}/daduda.png" "$pkgdir/usr/share/icons/daduda.png"
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

