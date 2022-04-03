# Maintainer: kyndair <kyndair at gmail dot com>
pkgname=sacd-extract-git
_pkgname=sacd-ripper
pkgver=0.3.9.3.r107.g01c90dd
pkgrel=1
pkgdesc="Extract DSDIFF files, DSF files or RAW ISO from SACD"
arch=('i686' 'pentium4' 'x86_64')
url="https://github.com/EuFlo/sacd-ripper"
license=('GPL-2.0')
makedepends=('cmake')
provides=('sacd-extract')
conflicts=('sacd-extract')
source=('git+https://github.com/EuFlo/sacd-ripper.git')
sha256sums=('SKIP')

# update the package version to the current git version
pkgver() {
        cd "${srcdir}/$_pkgname"
        git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}/tools/sacd_extract/"
    cmake .
    make
}

package() {
    # install executable
    install -Dm755 "${srcdir}/sacd-ripper/tools/sacd_extract/sacd_extract" "${pkgdir}/usr/bin/sacd_extract"
    #install readme.txt
    install -Dm644 "${srcdir}/sacd-ripper/tools/sacd_extract/readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/$pkgname-readme.txt"
}
