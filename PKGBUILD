# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.7.5 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=3
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OPENBlas CPU optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('blas-openblas')
makedepends=(
  'cmake'
  'git'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -B build \
    -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_OPENBLAS=1

  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('2fda42b57b7b8427d724551bd041616d85401fb9382e42b0349132a28920a34f')
