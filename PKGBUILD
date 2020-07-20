pkgname=scarlett-mixer-git
pkgver=v0.1.0.28.ga29c0a2
pkgrel=1
pkgdesc="Graphical Mixer Interface for the Scarlett series"

url="https://github.com/x42/scarlett-mixer"
arch=('x86_64')
license=('GPL2')

depends=('alsa-lib' 'mesa' 'pango')
makedepends=('git' 'gcc' 'make' 'pkg-config' 'lv2')

source=("git+https://github.com/x42/scarlett-mixer.git")
md5sums=('SKIP')



pkgver() {
  cd "${srcdir}/scarlett-mixer"
  git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}


build() {
  cd "${srcdir}/scarlett-mixer"
  git submodule init
  git submodule update
  make
}

package() {
  cd "${srcdir}/scarlett-mixer"
  make install PREFIX="${pkgdir}/usr/"
}

