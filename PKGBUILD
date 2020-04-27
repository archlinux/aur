# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=hal-git
pkgver=v2.0.0.r139.gc906c8fc
pkgrel=1
pkgdesc='The Hardware Analyzer for Hardware Reversing from emsec. (git version)'
arch=('x86_64')
url='https://github.com/emsec/hal'
license=('MIT')
depends=('lcov' 'gcovr' 'doxygen' 'boost' 'qt5-svg' 'libsodium' 'igraph' 'ninja' 'rapidjson' 'spdlog' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-jedi' 'python-pip' 'python-dateutil' 'pybind11')
optdepends=('graphviz: for documentation')
makedepends=('git' 'cmake' 'ccache')
source=("$pkgname::git+https://github.com/emsec/hal.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	sed -i 's:enable_cxx_compiler_flag_if_supported("-fcolor-diagnostics" "")::g' ./CMakeLists.txt
}

pkgver() {
	cd "$pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"

        mkdir -p build && cd build
        cmake ..
        make
}

package() {
	cd "$pkgname/build"
        make DESTDIR="$pkgdir" install
}
