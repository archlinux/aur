pkgname=opendnp3-git
_name=${pkgname%-git}
pkgver=2.3.1.r6.g44c06cb14
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='DNP3 (IEEE-1815) protocol stack built with modern C++'
license=('APACHE')
depends=('asio')
makedepends=('cmake' 'git')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/dnp3/${_name}"
source=("${_name}::git://github.com/dnp3/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_name}"
  cmake .
  make
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install
}
