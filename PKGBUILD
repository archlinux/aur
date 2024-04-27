# Maintainer: Posi <posi1981@gmail.com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

_pkgname=coreutils
_commit=42cadf5b7915523e77ae43b5cc9fa74e0def72c6
pkgname=advcpmv
pkgver=9.5
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
sha256sums=('cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a'
            'SKIP'
            '2d17dbe2179994050a89797f842fc7828a9e18cc42b7caee058654adbcd21fe6')

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
