# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: dekart811
# Contributor: hazelnot
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=bsnes-hd
pkgver=10.6
pkgrel=1
pkgdesc='A fork of bsnes (great SNES emulator by Near) that adds HD video features and widescreen'
arch=('x86_64')
url='https://github.com/DerKoun/bsnes-hd'
license=('GPL3')
depends=('alsa-lib' 'gtk2' 'libao' 'libpulse' 'libxv' 'openal' 'sdl2' 'perl-net-dbus' 'perl-x11-protocol')
makedepends=('git')
provides=('bsnes')
conflicts=('bsnes')

source=(
  "https://github.com/DerKoun/bsnes-hd/archive/refs/tags/beta_${pkgver/\./_}.tar.gz"
  'bsnes-hd.patch'
)

sha512sums=(
  '8c4a11d7bd072e839dbf49eb5a5a2e7c27969bdbf5dd8b66a9ad6db887f3eac9bb9b1ac7d47b7ba2044f9ca61a893e701dd7c54d494b4aa52d807eedb5860096'
  '01d88af9cf5e20b8f380d61c7290dd8b3423b4f0d66de9db42873fea66c7e261bef4a318a18d3f60c221abb00b9321affcef4b0195df090ec0f93eadd195af11'
)

prepare() {
  cd $pkgname-beta_${pkgver/\./_}
  # fix root issue in package
  patch -Np1 -i "$srcdir/bsnes-hd.patch"
}

build() {
  cd $pkgname-beta_${pkgver/\./_}/bsnes
  make
}

package() {
  cd $pkgname-beta_${pkgver/\./_}/bsnes
  make prefix="$pkgdir/usr" install
}
