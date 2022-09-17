# Maintainer: Kyle <kyle@free2.ml>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=('espeak-ng-git')
pkgver=1.51.r260.g4acc2954
pkgrel=1
pkgdesc="Multi-lingual software speech synthesizer (development version)"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/espeak-ng/espeak-ng"
license=('GPL3')
depends=('pcaudiolib' 'libsonic')
makedepends=('git' 'ruby-ronn-ng')
checkdepends=('python')
replaces=('espeak-ng-espeak-git' 'espeak-ng-espeak')
provides=('espeak-ng-espeak-git' 'espeak-ng-espeak' 'espeak-ng')
conflicts=('espeak-ng-espeak' 'espeak-ng' 'espeak')
options=(debug)
source=(${pkgname%-git}::'git+https://github.com/espeak-ng/espeak-ng.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  ./autogen.sh
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname%-git}
  make -j1 check
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/vim/{addons,vimfiles}
  rm -r "$pkgdir"/usr/{include/espeak,share/vim/registry}
}
