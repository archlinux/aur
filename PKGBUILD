
pkgname=scopehal-apps-git
pkgver=0.0.3323a0f
pkgrel=1
pkgdesc="glscopeclient and other client applications for libscopehal"
arch=('x86_64')
url="https://github.com/glscopeclient/scopehal-apps"
license=('BSD')
groups=()
depends=('glm' 'gtkmm3' 'libsigc++' 'libyaml' 'liblxi-git' 'texlive-core' 'texlive-fontsextra' 'glew' 'catch2' 'clfft' 'ffts-git')
makedepends=('cmake')
md5sums=('SKIP' 'SKIP')
source=("git+https://github.com/glscopeclient/scopehal-apps.git" "modules.patch")

pkgver() {
  cd "${srcdir}/scopehal-apps"
  echo "0.0."`git describe --always`
}

prepare() {
    patch "$srcdir/scopehal-apps/.gitmodules" modules.patch
	cd "$srcdir/scopehal-apps"
	git submodule update --init --recursive
}

build() {
    cd "$srcdir/scopehal-apps"
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr
    make -j6
}

package() {
	cd "$srcdir/scopehal-apps/build"
	make DESTDIR="$pkgdir/" install
}
