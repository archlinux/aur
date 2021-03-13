# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=non-euclidean-git
pkgver=r31.8bbf723
pkgrel=3
pkgdesc='Tiny Non-Euclidean engine'
arch=($CARCH)
url='https://github.com/Srinivasa314/NonEuclidean'
license=(MIT)
depends=(glew sdl2)
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd NonEuclidean/NonEuclidean
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd NonEuclidean/NonEuclidean
  make all
}

package() {
  cd NonEuclidean
  install -Dm755 NonEuclidean/NonEuclidean "$pkgdir/opt/NonEuclidean/non-euclidean"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NonEuclidean/Meshes/* -t "$pkgdir/opt/NonEuclidean/Meshes/"
  install -Dm644 NonEuclidean/Shaders/* -t "$pkgdir/opt/NonEuclidean/Shaders/"
  install -Dm644 NonEuclidean/Textures/* -t "$pkgdir/opt/NonEuclidean/Textures/"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/NonEuclidean/non-euclidean "$pkgdir/usr/bin/non-euclidean"
  chmod +x "$pkgdir/usr/bin/non-euclidean"
}
