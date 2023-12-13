# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: vlad0x00 <see github>

pkgname=btllib
pkgver=1.7.0
pkgrel=1
pkgdesc="Bioinformatics Technology Lab common code library https://doi.org/10.21105/joss.04720"
arch=('x86_64')
url="https://github.com/bcgsc/btllib"
license=(GPL3)
depends=('gcc-libs' 'samtools' 'python')
makedepends=('meson' 'ninja' 'cmake' 'git' 'doxygen' 'swig')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/btllib-${pkgver}.tar.gz")
sha256sums=('a9a2b7d5c65865b20ee6467657c08ac05c9ea1f7c993bf44c3ffcf044b200def')
options=('!strip')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./compile
}

package() {
    # Install binary files
    install -d "${pkgdir}/usr/bin"
    for file in "$srcdir/$pkgname-$pkgver/install/bin/"*; do
        install -m 755 "${file}" "${pkgdir}/usr/bin/"
    done

    # Install include files
    install -d "${pkgdir}/usr/include"
    cp -a "$srcdir/$pkgname-$pkgver/install/include/"* "${pkgdir}/usr/include/"

    # Install library files
    install -d "${pkgdir}/usr/lib"
    cp -a "$srcdir/$pkgname-$pkgver/install/lib/"* "${pkgdir}/usr/lib/"
}
