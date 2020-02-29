# Maintainer: Rup <boraxkasein [at] gmail [dot] com>

_pkgname=zatackax
pkgname="${_pkgname}-git"
pkgver=0.3.2.r3.gd577efa
pkgrel=2
pkgdesc="A modern, free remake of the classic Achtung, die Kurve!"
arch=('x86_64' 'i686')
url="https://github.com/simenheg/zatackax"
license=('GPL3')
depends=('sdl>=1.2' 'sdl_image>=1.2' 'sdl_ttf>=2.0' 'sdl_mixer>=1.2')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/simenheg/zatackax.git"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'b6feb8f64b918f637cb0a5e4989d1bd242ee3aee1a9d05d952b77812bdb41545'
            '424c0e5e693efc269fdeddcf46351724b8e95dedff57390fda96d3f79f623e1b')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd "${_pkgname}"
    make prefix="$pkgdir/usr/" install
}
