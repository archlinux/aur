# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-libafb-git
pkgver=4.0.0beta5
pkgrel=1
pkgdesc="Core library of Application Framework Binder"
arch=('x86_64')
url="https://github.com/redpesk-core/afb-libafb.git"
license=('LGPL3')
depends=('libmicrohttpd' 'json-c' 'file')
makedepends=('cmake' 'gcc' 'make' 'lua' 'afb-binding' 'git')
checkdepends=()
optdepends=()
provides=('afb-libafb')
conflicts=('afb-libafb')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/redpesk-core/afb-libafb.git")
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
		-DWITH_LIBUUID=NO \
		-DWITHOUT_CYNAGORA=YES \
		"$srcdir/${pkgname%-git}"
    make -j
}

package() {
	make DESTDIR="$pkgdir/" install
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE.GPLv3" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPLv3"
}
