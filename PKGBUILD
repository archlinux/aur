# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'glm' 'capstone' 'llvm-libs' 'llvm' 'nlohmann-json' 'python')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WerWolv/ImHex/archive/v${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/WerWolv/ImHex/59155256a99da8a7a476089507a6e294d68d6343/LICENSE')
sha256sums=('10c10d5a7a9198b5f0b146cd41596fb87516ee7e378b3c7e863e7ea349a5d8b9'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
b2sums=('8f34f4eb7eb5b94b86b780131f05b1101dd15eb0f433c85d5f9712a3be9337359ab4ccfd3359bf624594a5c434575f59566e8a5518082c0d842d49ed83515eaa'
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
