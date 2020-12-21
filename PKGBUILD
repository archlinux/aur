# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-binding-git
pkgver=4.0.0beta2+3+g25d7df0
pkgrel=1
pkgdesc="Header files for developing bindings of Application Framework Binder"
arch=('x86_64')
url="https://github.com/redpesk-core/afb-binding.git"
license=('LGPL3')
depends=()
makedepends=('git' 'cmake' 'gcc' 'make' 'lua')
checkdepends=()
optdepends=()
provides=('afb-binding')
conflicts=('afb-binding')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/redpesk-core/afb-binding.git")
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
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE.LGPLv3" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LGPLv3"
}
