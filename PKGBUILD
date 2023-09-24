# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Sythelux Rikd <dersyth@gmail.com>
_corpname=python-glaxnimate
_pkgname='glaxnimate'
pkgname=python-glaxnimate
_git_branch=release
pkgver=0.5.4
pkgrel=1
tag=2236388
pkgdesc="Python bindings for Glaxnimate."
url="https://glaxnimate.mattbas.org/"
license=('GPL3')
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
makedepends=('git' 'qt5-base' 'python' 'zlib' 'hicolor-icon-theme' 'potrace' 'ffmpeg' 'cmake' 'qt5-tools')
depends=('python' 'qt5-base' 'potrace' 'ffmpeg')
source=(
	"$_pkgname::git+https://gitlab.com/mattbas/$_pkgname/#branch=$_git_branch"
)
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname/"

	# Provide git submodules
	git submodule init
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_pkgname/"

        if [ ! -e build ]; then mkdir build; fi
	cd build
	cmake ".." -DCMAKE_INSTALL_PREFIX=/usr -DVERSION_SUFFIX="" on cmake
	make glaxnimate_python
}

package() {
	echo "package"
	cd "$srcdir/$_pkgname/build/bin/python"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
