# Maintainers: 
# Eric Schulte <eschulte@grammatech.com>
# Xiaowen Hu <xihu5895@uni.sydney.edu.au>

#
# This PKGBUILD is automatically generated and always points to the 
# latest release from the souffle official repository.
# Source: .github/images/arch-linux/PKGBUILD.in
#

pkgname=souffle
pkgver=2.4.1
pkgrel=1
pkgdesc="Soufflé is a translator of declarative Datalog programs into the C++ language"
arch=('any')
url="https://github.com/souffle-lang/souffle"
license=('UPL')
groups=()
depends=('mcpp' 'gcc>=8' 'openmp' 'sqlite' 'python3')
makedepends=('git' 'cmake>=3.15' 'bison>=3.0.4' 'flex' 'libffi' 'ncurses' 'zlib' 'python3')
optdepends=('bash-completion')
provides=('souffle')
conflicts=('souffle-git')
source=(souffle-2.4.1.tar.gz::https://github.com/souffle-lang/souffle/archive/2.4.1.tar.gz)
md5sums=('SKIP')

build() {
	cd souffle-${pkgver}
	cmake -S . -B ./build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSOUFFLE_GIT=OFF \
        -DSOUFFLE_VERSION=${pkgver} \
        -DPACKAGE_VERSION=${pkgver} \

    cmake --build ./build --parallel "$(nproc)"
}

package() {
	cd souffle-${pkgver}/build
	make DESTDIR="$pkgdir/" install
}
