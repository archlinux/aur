# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-cmake-modules-git
pkgver=10.0.0
pkgrel=1
pkgdesc="This is a CMake module made to ease development of binding and application framework binder apps."
arch=('any')
url="https://github.com/redpesk-core/afb-cmake-modules.git"
license=('LGPL3')
depends=('make')
makedepends=('cmake' 'gcc' 'lua' 'git')
checkdepends=()
optdepends=()
provides=('afb-cmake-modules')
conflicts=('afb-cmake-modules')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/redpesk-core/afb-cmake-modules.git")
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
