# Maintainer: Posi <posi1981@gmail.com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

_pkgname=coreutils
_commit=0064105957e46a65954c333e64cfb1d24e8ce2b0
pkgname=advcpmv
pkgver=9.2
pkgrel=3
pkgdesc="'cp' and 'mv' utilities with progress bar patches"
arch=('x86_64')
license=('GPL3')
url='https://github.com/jarun/advcpmv'
depends=('glibc' 'acl' 'attr')
provides=('acp' 'amv' 'advcp' 'advmv' 'cpg' 'mvg')
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${pkgname}-${pkgver}-${pkgrel}.patch::https://raw.githubusercontent.com/jarun/advcpmv/${_commit}/advcpmv-0.9-${pkgver}.patch")
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('6885ff47b9cdb211de47d368c17853f406daaf98b148aaecdf10de29cc04b0b3'
            'SKIP'
            '8da4e9a6c012624c74de648073555eee019e2e423c4e1b5636d324b9f77460f8')

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
