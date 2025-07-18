# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgbase=pytouhou
pkgname="$_pkgbase-hg"
pkgver=773
pkgrel=1
pkgdesc='Libre reimplementation of the Touhou 6 engine.'
arch=('i686' 'x86_64' 'armv7h')
url='https://pytouhou.linkmauve.fr/'
license=('GPL3')
depends=('python' 'glfw' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'libepoxy' 'libgl')
makedepends=('mercurial' 'cython')
provides=("pytouhou=$pkgver")
conflicts=('pytouhou')
optdepends=('th06-demo-pytouhou: the freeware demo of EoSD.')

source=("$_pkgbase::hg+https://hg.linkmauve.fr/touhou")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  hg identify -n
}

build() {
  cd "$srcdir/$_pkgbase"
  cargo build --release
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase"
  install -Dm755 target/release/libtouhou.so "$pkgdir"/usr/lib/python3.13/site-packages/libtouhou.so
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sts=2 sw=2 et:
