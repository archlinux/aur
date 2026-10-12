# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=localtranslate
pkgver=0.6.0
pkgrel=3
pkgdesc="Local, offline neural machine translation application"
arch=('x86_64')
url="https://github.com/terslang/LocalTranslate"
license=('GPL-3.0-or-later')
depends=('kotki' 'mecab' 'mecab-ipadic' 'icu' 'qt6-declarative' 'qt6-base' 'gcc-libs' 'localtranslate-models-base')
makedepends=('cmake' 'ninja' 'qt6-tools' 'cli11' 'rapidjson' 'intgemm' 'sentencepiece-browsermt' 'marian-lite' 'yaml-cpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/terslang/LocalTranslate/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba10a6c930c08031af0646e3f6cd3742d2a39d72dfbdbc2666c04bf4bb6d688b')

build() {
	cmake -S "LocalTranslate-$pkgver" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_CXX_STANDARD=17
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
