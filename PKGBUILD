# Maintainer: Posi <posi1981@gmail.com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

_pkgname=coreutils
_commit=8e1c0d4f8a255091c59cf187a43a06cd264dc273
pkgname=advcpmv
pkgver=9.0
pkgrel=3
pkgdesc="'cp' and 'mv' utilities with progress bar patches"
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/coreutils/'
depends=('glibc' 'acl' 'attr')
provides=('acp' 'amv' 'advcp' 'advmv' 'cpg' 'mvg')
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${pkgname}-${pkgver}-${pkgrel}.patch::https://raw.githubusercontent.com/jarun/advcpmv/${_commit}/advcpmv-0.9-${pkgver}.patch")
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce'
            'SKIP'
            '889b1b1d0dbcd2b99e05daf2d53feff9002720eb1232968eb3c60983f76c7b72')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.patch"
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
