# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

pkgname=camorama
pkgver=0.20.7.r51.gcde678b
pkgrel=1
pkgdesc="GNOME 2 Webcam application featuring various image filters"
url="https://github.com/mchehab/camorama"
arch=('x86_64')
license=('GPL2')
depends=('libgnomeui')
makedepends=('git' 'gnome-common' 'v4l-utils')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" make install
}
