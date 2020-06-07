# Maintainer: Bas Magré <Opvolger@gmail.com>
# current version libxmp-git has no aarch64 support.
pkgname='libxmp-aarch64-git'
pkgver=libxmp.4.4.1.r161.g92313f6f
pkgrel=2
pkgdesc="Libxmp is a library that renders module files to PCM data. It supports over 90 mainstream and obscure module formats."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://xmp.sourceforge.net/"
license=('LGPL2.1')
depends=('sdl' 'libvorbis' 'curl' 'glibc')
optdepends=('pulseaudio')
makedepends=('git' 'make' 'autoconf')
conflicts=('libxmp')
provides=('libxmp')
source=('git+https://github.com/cmatsuoka/libxmp.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libxmp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/libxmp"
  autoconf
}

build() {
  cd "${srcdir}/libxmp"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/libxmp"
  make -k check
}

package() {
  cd "${srcdir}/libxmp"
  make DESTDIR="$pkgdir" install
}
