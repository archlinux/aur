# Maintainer: Posi <posi1981@gmail.com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

_pkgname=coreutils
_commit=2961dc3ec81dfaa3d00091edfcf8a7559ca67bfb
pkgname=advcpmv
pkgver=9.4
pkgrel=1
pkgdesc="'cp' and 'mv' utilities with progress bar patches"
arch=('x86_64')
license=('GPL3')
url='https://github.com/jarun/advcpmv'
depends=('glibc' 'acl' 'attr')
provides=('acp' 'amv' 'advcp' 'advmv' 'cpg' 'mvg')
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${pkgname}-${pkgver}-${pkgrel}.patch::https://raw.githubusercontent.com/jarun/advcpmv/${_commit}/advcpmv-0.9-${pkgver}.patch")
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52'
            'SKIP'
            'b05ab0a352dc4eb839c4adb2befe2de8f6f1bc69bf2a5eec1a4f4f2d369e12b3')

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
