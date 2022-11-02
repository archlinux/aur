# Contributor: Joe Davison <joe@warhaggis.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: zer0def <zer0def on freenode>

pkgname=libpurple-signald-git
pkgver=0.12.0.r0.g87409b4
pkgrel=1
pkgdesc='Pidgin libpurple bridge to signald.'
url='https://github.com/hoehermann/libpurple-signald'
license=('GPL3')
arch=('any')
depends=('json-glib' 'libpurple' 'signald')
makedepends=('cmake' 'git')
provides=('libpurple-signald')
conflicts=('libpurple-signald')
source=("${pkgname}::git+https://github.com/hoehermann/libpurple-signald")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake .
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}
