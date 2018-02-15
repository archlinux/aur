# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=bookworm-git
pkgver=1.0.0.r10.g65ec1de
pkgrel=1
pkgdesc='A simple user centric eBook reader which displays multiple eBooks formats uniformly'
arch=('i686' 'x86_64')
url='https://babluboy.github.io/bookworm'
license=('GPL3')
depends=('libgranite.so' 'poppler-glib' 'python2-html2text' 'unrar' 'unzip' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/babluboy/bookworm.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${pkgname%-*}" DESTDIR="$pkgdir" install
}
