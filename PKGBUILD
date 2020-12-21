# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-libhelpers-git
pkgver=9.99.1+20+g6cc5d85
pkgrel=1
pkgdesc="useful utilities to integrate in your afb bindings development."
arch=('x86_64')
url="https://github.com/redpesk-common/afb-libhelpers.git"
license=('LGPL3')
depends=()
makedepends=('cmake' 'gcc' 'make' 'lua' 'git')
checkdepends=()
optdepends=()
provides=('afb-libhelpers')
conflicts=('afb-libhelpers')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/redpesk-common/afb-libhelpers.git")
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

	#keep compatibility with ancient name
	ln -sf afb-libhelpers.pc "${pkgdir}/usr/lib/pkgconfig/afb-helpers.pc"

    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
