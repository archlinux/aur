# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Max Zhao <alcasa dot mz at gmail dot com>
# Contributor: Leonard König <leonard.r.koenig at googlemail dot com>

pkgname=endless-sky
pkgver=0.9.13
pkgrel=1
arch=('x86_64' 'i686')
url="https://endless-sky.github.io/"
depends=(
  gcc-libs
  openal
  libpng
  glew
  hicolor-icon-theme
  libjpeg-turbo
  sdl2
  libmad
)
makedepends=(scons)
optdepends=(
  'endless-sky-high-dpi: high resolution graphics assets'
  'endless-sky-editor: map editor'
)
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A sandbox-style space exploration and combat game"
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/endless-sky/archive/v$pkgver.tar.gz")
b2sums=('6d4c7f37ce4dfff2bae3eb6cee4948e6e27df086c2017f56bddf2d212011bfff135931915ab3f34c5e2f432acbf38126f7a774835d427652c8870d98e66c5f06')

prepare() {
  cd "$pkgname-$pkgver"

  # binary is installed to /usr/games instead of /usr/bin
  sed -i 's:games", sky:bin", sky:' SConstruct
}

build() {
  cd "$pkgname-$pkgver"
  scons -j "$(nproc)"
}

package() {
  cd "$pkgname-$pkgver"
  scons DESTDIR="$pkgdir" PREFIX=/usr install

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" copyright
}

# vim:set ts=2 sw=2 et:
