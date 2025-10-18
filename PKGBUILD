# Maintainer: Nathan Chere <git at nathanchere dot com dot au>
# Contributor: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-pyxel
pkgver=2.5.8
pkgrel=1
pkgdesc='Retro game development environment'
arch=('i686' 'x86_64')
url='https://github.com/kitao/pyxel'
license=('MIT')
depends=('gcc-libs' 'glibc' 'python' 'sdl2')
optdepends=('pyinstaller')
makedepends=('cargo-nightly' 'clang' 'python-build' 'python-installer' 'python-maturin')
source=("pyxel-$pkgver::https://github.com/kitao/pyxel/archive/v$pkgver.tar.gz")
md5sums=('02ce5b3b8caf17ea2a8f1861c97b426d')

options=('!debug')

prepare() {
  cd pyxel-$pkgver
  sed -i -e 's-/usr/local/include-/usr/include/SDL2-' rust/pyxel-platform/build.rs
}

build() {
  cd pyxel-$pkgver/python

  export RUSTUP_TOOLCHAIN=nightly
  python -m build --wheel --no-isolation
}

package() {
  cd pyxel-$pkgver/python

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
