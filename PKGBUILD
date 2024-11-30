# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: vlad0x00 <see github>

pkgname=btllib
pkgver=1.7.4
pkgrel=1
pkgdesc="Bioinformatics Technology Lab common code library https://doi.org/10.21105/joss.04720"
arch=('x86_64')
url="https://github.com/bcgsc/btllib"
license=(GPL3)
depends=('gcc-libs' 'samtools' 'python')
makedepends=('meson' 'ninja' 'cmake' 'git' 'doxygen' 'swig')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/btllib-${pkgver}.tar.gz")
sha256sums=('8c046340b9db4d580521297bfd9cb55af6877a34b48cf6a053266703ebc17837')
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
