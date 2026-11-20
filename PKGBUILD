# Maintainer: Nathan Chere <aur at nathanchere dot com dot au>
# Contributor: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-pyxel
pkgver=3.0.3
pkgrel=1
pkgdesc='Retro game development environment'
arch=('i686' 'x86_64')
url='https://github.com/kitao/pyxel'
license=('MIT')
depends=('gcc-libs' 'glibc' 'python' 'sdl2')
optdepends=('pyinstaller')
makedepends=('cargo-nightly' 'clang' 'patchelf' 'python-installer' 'python-maturin')
source=("pyxel-$pkgver.tar.gz::https://github.com/kitao/pyxel/archive/v$pkgver.tar.gz")
sha256sums=('c630905c5c971650b8a69aa000939f0fe9c6edfd3d01cb77092e7bd7baff74a7')

options=('!debug')

build() {
  cd "pyxel-$pkgver/python"
  cp ../README.md ../LICENSE pyxel/
  maturin build --locked --release --features sdl2_dynamic --compatibility linux -o ../dist
}

package() {
  cd pyxel-$pkgver/python

  python -m installer --destdir="$pkgdir" ../dist/*.whl
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
