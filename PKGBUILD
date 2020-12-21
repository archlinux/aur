# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-libcontroller-git
pkgver=9.99.1+34+g0088350
pkgrel=1
pkgdesc="useful utilities to integrate in your afb bindings development."
arch=('x86_64')
url="https://github.com/redpesk-common/afb-libcontroller.git"
license=('LGPL3')
depends=()
makedepends=('cmake' 'gcc' 'make' 'lua' 'git' 'afb-libhelpers-git')
checkdepends=()
optdepends=()
provides=('afb-libcontroller')
conflicts=('afb-libcontroller')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/redpesk-common/afb-libcontroller.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	git describe | sed "s/-/+/g"
}

build() {
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
		"$srcdir/${pkgname%-git}"
    make -j
}

package() {
	make DESTDIR="$pkgdir/" install
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
