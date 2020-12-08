# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.5.0
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'glm' 'capstone' 'llvm-libs' 'llvm' 'nlohmann-json' 'python')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WerWolv/ImHex/archive/v${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/WerWolv/ImHex/59155256a99da8a7a476089507a6e294d68d6343/LICENSE')
sha256sums=('211cca3a22d9c0d8a7a3bfa2a3aa7c29cd954c207979632fe9b9a08cf9b8444b'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
b2sums=('247233bab30c569b8b980b7ef436b572fdfb76ca8af92289af510907a20081d309f3f50b6c9a53c5e65e2250d96f45bf7b508719c9133b67fdc9f4d70544ce65'
        '1e1e108a77d8676eb68467cdfbf95684f0bad991bfcc24e7bd3d1eec58d746f14d20798c3bcf64e9bdd1ff4a9c5ec02ccb4c06331bcf251a9d1d0f28b6875296')

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  # cmake --install build --prefix "${pkgdir}/usr"
  install -Dm0755 "build/${_pkgname}" "${pkgdir}/usr/bin/imhex"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
