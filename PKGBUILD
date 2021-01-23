# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=('squashfs-tools-ng' 'squashfs-tools-ng-doc')
pkgver=1.0.4
pkgrel=1
epoch=
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib' 'attr')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc})
sha512sums=('c0a24be6b07739713213fc5936506ea7c1f62fa461f60955986ac4dda6958203e74336418abe615ecc85c62deb085039ca375891538ae01c21672d4911091614'
            'SKIP'
	   )
validpgpkeys=('13063F723C9E584AEACD5B9BBCE5DC3C741A02D1')
groups=()
makedepends=(
    'fakeroot'
    'binutils'
    'autoconf'
    'automake'
    'autogen'
    'libtool'
    'pkgconf'
    'm4'
    'make'
    'gcc'
    'doxygen')
#
checkdepends=()
optdepends=('squashfs-tools')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
    make doxygen-doc
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package_squashfs-tools-ng() {
    #depends=('zstd' 'attr' 'zlib' 'xz' 'lzo' )
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

package_squashfs-tools-ng-doc() {
    arch=('any')
    optdepend=()
    depends=()
    cd "$pkgbase-$pkgver"
    install -d "$pkgdir/usr/share/doc/$pkgbase"
    cp -a doxygen-doc/* "$pkgdir/usr/share/doc/$pkgbase"
}
