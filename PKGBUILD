# Maintainer: Brli <brli [at] aur.no.reply>
_pkgname='brlaser'
pkgname="${_pkgname}-git"
pkgver=6.2.7.r3.gbffa87a
pkgrel=1
pkgdesc="Brother laser printer driver, git version"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Owl-Maintain/brlaser"
license=('GPL2')
depends=('cups')
makedepends=('cmake' 'git')
conflicts=("$_pkgname")
provides=("$_pkgname")
replaces=("$_pkgname")
source=("git+https://github.com/Owl-Maintain/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
    cd "${_pkgname}" || exit
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "${_pkgname}" \
	      -B build \
	      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	      -D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

check() {
	cd build || exit
	make -k check
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
