# Maintainer: Clément Bénier <clement.benier@iot.bzh>
pkgname=app-framework-binder-git
pkgver=8.0.0
pkgrel=1
pkgdesc="Provides a test agl binder service which can be used to test agl bindings on Linux PC
This service is evolving permanently and is only designed as a helper for developper."
arch=('x86_64')
url="https://gerrit.automotivelinux.org/gerrit/#/admin/projects/src/app-framework-binder"
license=('Apache-2.0')
depends=('systemd' 'json-c' 'libgcrypt')
makedepends=('gcc' 'systemd-libs' 'make' 'openssl' 'libutil-linux' 'json-c' 'libmicrohttpd')
checkdepends=()
optdepends=()
provides=('app-framework-binder')
conflicts=('app-framework-binder')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://gerrit.automotivelinux.org/gerrit/src/app-framework-binder")
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
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE-2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-2.0.txt"
}
