# Maintainer: Sven Klotz <sven.klotz@protonmail.com>

pkgname=gotcha
pkgver=1.0.8
pkgrel=1
pkgdesc='A library that wraps functions.'
arch=('x86_64')
url='https://github.com/LLNL/GOTCHA'
license=('LGPL-2.1-only')
depends=(glibc)
makedepends=(cmake make patch)
provides=('libgotcha.so=2-64')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LLNL/GOTCHA/archive/refs/tags/${pkgver}.tar.gz"
        'update-cmake-minimum-version.patch')

sha256sums=('267ac6d02916863c8a360b192f1f36e4eaeb8945c73ae7f92116d6f801ad8184'
            '5b53ce2129e4e92ea330084428118d61bcb66b11310e6145b0c859601856ada4')
sha384sums=('976104bb124792e099d7f9c5a5fac00510e8e0a974349b3c8c8c477412d311196201aab862dfe1c4455b91732cbba489'
            '966043c3244ca3a9b275fdc3cf5f7d7321817c4de7f965a8c061d449046c1412d4de3a144b1b36953a5a308aec76bc76')
sha512sums=('6a3b5b0a4f3f17d9145e192d29c58c0b76daaefa8700f7f4e5f7e0ed3f992cfc7bfdf80d630e315f572eae6d5897e3889f7944421952e9e9a9ba86f00c5ff2a5'
            '4eef10487d3bfb641a4403e51877b5c7536a9474762ec94e9d2cac063e4329da9d937ef95ee8a32e9249811fdec83f3c0e306134d2d2c453839a24b99c7bb779')
b2sums=('6a44fb8d819afbfebe390c48d454b416c6cf2bdc1c0b8eb35d46f9ae160af82a08debff0a92393de96aff2d5a2bb751ac1ddb0dfbbc83555e3d210b53d05fcc3'
        '142598f2d655a38f52c47c0b538ceb68b5492684f8bfb0ef65da1658e3c5fed0d19bbec432866b3938b58e5d584596020d957a00b1ef7c28f11533a6b4d26d01')


prepare() {
  tar xf "${pkgname}-${pkgver}.tar.gz"
}

build() {
  cd "${pkgname^^}-${pkgver}"

  patch 'CMakeLists.txt' "../${source[1]}"

  cmake -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev

  cmake --build build
}

package() {
  cd "${pkgname^^}-${pkgver}"

  cmake --install build --prefix "${pkgdir}/usr"

  install -Dm644 LGPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
