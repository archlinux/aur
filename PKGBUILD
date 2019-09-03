# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=afb-helpers-git
pkgver=8.0.0
pkgrel=1
pkgdesc="Library providing some helpful functions for apps using Application Framework Binder"
arch=('x86_64')
url="https://gerrit.automotivelinux.org/gerrit/#/admin/projects/src/libafb-helpers"
license=('Apache-2.0')
depends=('systemd' 'json-c' 'lua' 'app-framework-binder')
makedepends=('cmake' 'gcc' 'make' 'lua' 'app-framework-binder' 'cmake-afb-template')
checkdepends=()
optdepends=()
provides=('afb-helpers')
conflicts=('afb-helpers')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://gerrit.automotivelinux.org/gerrit/src/libafb-helpers")
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
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
