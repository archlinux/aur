# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=('squashfs-tools-ng' 'squashfs-tools-ng-doc')
pkgver=1.3.2
pkgrel=1
epoch=
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib' 'attr' 'bzip2')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc}
       )
sha512sums=('6f14d90875ef3f3d36d3cd38932ade6b0da7284922c914bd655e3f0a4abb17ba75d4bc052a1d4244c1b4ff96b3798d83d5a7b3263b8e1b96c112f4cdf967400f'
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
