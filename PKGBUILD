# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=showq-git
pkgver=r57.2f53d5d
pkgrel=1
pkgdesc="ShowQ is a cue-player for theater productions"
arch=('x86_64')
url="https://github.com/evandelisle/showq"
license=('GPL2')
depends=('gtkmm'
     'alsa-lib'
     'libsndfile'
     'jack'
     'libxml++2.6'
     'libsamplerate')
makedepends=('meson' 'ninja' 'gcc')
source=("showq::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/showq"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/showq"
  mkdir build
  cd build
  meson --prefix=/usr
  ninja
}

package() {
  cd "$srcdir/showq/build"
  DESTDIR="$pkgdir" ninja install
}