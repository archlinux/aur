# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=0.35
pkgrel=1
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'vulkan-headers')
conflicts=('bullet')
source=("git+https://github.com/Try/OpenGothic#tag=v${pkgver}")
sha512sums=('SKIP')
options=('!emptydirs')

prepare() {
  cd "OpenGothic"
  git submodule update --init --recursive
}

build() {
  cd "OpenGothic"
  cmake -B build -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "OpenGothic"
  DESTDIR="${pkgdir}" make -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

