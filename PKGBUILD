# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=papyros-settings-git
pkgver=0.0.1.r3.g56fa0a4
pkgrel=1
pkgdesc="The file settings for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/settings-app"
license=("GPL")
depends=("qt5-declarative" "qml-material" "papyros-shell-git")
makedepends=("git" "cmake" "extra-cmake-modules")
provides=("$pkgname")
source=("$pkgname::git+https://github.com/papyros/settings-app.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}

# Additional functions to generate a changelog

changelog() {
    cd "$pkgname"
  	git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
    cd "$pkgname"
  	git rev-parse HEAD
}
