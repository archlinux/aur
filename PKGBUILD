# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-binder-git
pkgver=4.0.0beta+2+g2be7740
pkgrel=1
pkgdesc="This project provides the binder component of the microservice architecture for Application Framework."
arch=('x86_64')
url="https://github.com/redpesk-core/afb-binder.git"
license=('LGPL3')
depends=('afb-libafb-git')
makedepends=('cmake' 'gcc' 'make' 'lua' 'git')
checkdepends=()
optdepends=()
provides=('afb-binder')
conflicts=('afb-binder')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/redpesk-core/afb-binder.git")
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
