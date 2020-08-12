# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=onvifviewer
pkgver=0.12
pkgrel=2
pkgdesc='ONVIF camera viewer for Plasma Mobile and Linux desktop'
arch=(x86_64)
license=('GPL3')
depends=(
  'qt5-base>=5.10'
  'kdsoap'
  'breeze-icons'
)
optdepends=(
  'qtav'
)
makedepends=(
  'cmake>=3.7'
  'make'
  'extra-cmake-modules>=5.46'
  'kirigami2>=5.48'
)
source=("https://gitlab.com/caspermeijn/onvifviewer/-/archive/v${pkgver}/onvifviewer-v${pkgver}.tar.gz"
        'Patch-97-onvifdevicediscover-move-over-to-changed-api-of-kdsoap-ws-discovery-client.patch')
sha256sums=('23dc08c573766688527b8f88d8e3765700f83c72f033b9a42ff9752e0ab487db'
            '074cb2b89a784e51aa8ab9fa5b999dcc36bda92e90b09dbf3cad1cda9d97a00d')
b2sums=('d945702c243283fe7c0b0d15ef8c440788896aa5377d11574a46af6b0e04e558a449ac83120f3ecab8d12c5bfa176fd7621866bdf6888e9e839b1d1edc50bfde'
        '74bb998b45f2341ce8dc057bd676b094ca87811d15da04eff3a09338b7d636a110702c76db2567ba9758fb6e6e85d54caa2884108a6d939c2dd6dccc4fb24b5a')

build() {
  cd "onvifviewer-v${pkgver}"

  for f in "${srcdir}"/*.patch; do
    patch -Np1 < $f
  done

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S . -B build
  cmake --build build -j 1
}

package() {
  cd "onvifviewer-v${pkgver}"

  cmake --install build --prefix "${pkgdir}/usr"
}
