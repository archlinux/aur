# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Maintainer: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

_pkgname=coreutils
pkgname=advcp
pkgver=8.32
pkgrel=2
pkgdesc="'cp' and 'mv' utilities with progress bar patches"
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/coreutils/'
depends=('glibc' 'acl' 'attr')
provides=('acp' 'amv' 'advcp' 'advmv' 'cpg' 'mvg')
source=("ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-${pkgver}.patch")
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa'
            'SKIP'
            '6919835aac53c873267d199de8823e993d72870a5eb7b6caf566803a7f3f861e')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/advcpmv-0.8-${pkgver}.patch"
}

build() {
    cd "${_pkgname}-${pkgver}"
    ./configure --prefix=/usr \
                --libexecdir=/usr/lib
    make
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -D src/cp "${pkgdir}/usr/bin/advcp"
    ln -s advcp "${pkgdir}/usr/bin/acp"
    ln -s advcp "${pkgdir}/usr/bin/cpg"
    install -D src/mv "${pkgdir}/usr/bin/advmv"
    ln -s advmv "${pkgdir}/usr/bin/amv"
    ln -s advmv "${pkgdir}/usr/bin/mvg"
}
