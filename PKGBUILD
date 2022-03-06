# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: yaroslav <proninyaroslav@mail.ru>

pkgname=infer
pkgver=1.1.0
pkgrel=1
pkgdesc="A static analyzer for Java, C, C++, and Objective-C"
arch=('x86_64')
url="https://github.com/facebook/infer"
license=('MIT')
depends=('java-environment' 'opam' 'ocaml')
makedepends=('git' 'rsync' 'cmake' 'ninja' 'python' 'clang')
options=('!buildflags')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('201c7797668a4b498fe108fcc13031b72d9dbf04dab0dc65dd6bd3f30e1f89ee')

build() {
  cd "$pkgname-$pkgver"

  mkdir -p clang-setup
  CLANG_CMAKE_ARGS="-Wno-dev" CLANG_TMP_DIR="$(pwd)/clang-setup" INFER_CONFIGURE_OPTS="--prefix=/usr" ./build-infer.sh -y
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
