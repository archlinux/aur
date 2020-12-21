# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-client-git
pkgver=4.0.0beta2
pkgrel=1
pkgdesc="This project provides simple client of the Application Framework Binder of micro-service architecture."
arch=('x86_64')
url="https://github.com/redpesk-core/afb-client.git"
license=('LGPL3')
depends=('afb-libafb-git')
makedepends=('cmake' 'gcc' 'make' 'lua' 'git')
checkdepends=()
optdepends=()
provides=('afb-client')
conflicts=('afb-client')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/redpesk-core/afb-client.git")
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
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE.GPLv3" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPLv3"
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
