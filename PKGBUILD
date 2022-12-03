# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=('squashfs-tools-ng' 'squashfs-tools-ng-doc')
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib' 'attr' 'bzip2')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc}
       )
sha512sums=('0c52890a92e2aee928db3e2407c087703d331e9dd8cba1b58ef44fe78cdd7ed1523e9b0485f7da83ad77423ffdccaf392a2b752ad948d62a5f1b5e600b523070'
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
optdepends=()
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
    #depends=('zstd' 'attr' 'zlib' 'xz' 'lzo' 'bzip2' )
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
