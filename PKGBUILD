# Maintainer: Clément Bénier <clement@benier.bzh>
pkgname=cmake-afb-template-git
pkgver=8.0.0
pkgrel=1
pkgdesc="
This is a CMake module made to ease development of binding and application
framework binder apps."
arch=('any')
url="https://gerrit.automotivelinux.org/gerrit/#/admin/projects/src/cmake-apps-module"
license=('Apache-2.0')
groups=()
depends=()
makedepends=('cmake' 'gcc')
checkdepends=()
optdepends=()
provides=('cmake-afb-template')
conflicts=('cmake-afb-template')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://gerrit.automotivelinux.org/gerrit/src/cmake-apps-module")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git tag | grep -E "^[0-9]" | sort -r | head -1
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
