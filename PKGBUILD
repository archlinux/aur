# maintainer: simon chou <sentientcatgmaildotcom>
# contributor: loqs 

pkgname=ecbuild-git
pkgver=latest
pkgrel=1
#pkgdesc="A CMake-based build system"
pkgdesc="ecbuild - ECMWF build system"
arch=('any')
#url="https://github.com/ecmwf/ecbuild"
url="https://github.com/ecmwf/${pkgname%-git}"
license=('APACHE')
makedepends=('git' 'cmake')
#source=("$pkgname::git+https://github.com/ecmwf/ecbuild.git")
source=("git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
				  cd ${pkgname%-git}
					  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
				  cmake -B build -S ${pkgname%-git}  \
				        -DCMAKE_BUILD_TYPE='None' \
  			        -DCMAKE_INSTALL_PREFIX='/usr' \
				        -Wno-dev
				  make -C build
}

package() {
				  make -C build DESTDIR="$pkgdir" install
}
