# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=ibm-sw-tpm2
pkgver=1563
pkgrel=1
pkgdesc="An implementation of the TCG TPM 2.0 specification by IBM"
arch=(x86_64)
url="https://sourceforge.net/projects/ibmswtpm2/"
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm${pkgver}.tar.gz")
sha512sums=('ff0b9e5f0d0070eb572b23641f7a0e70a8bc65cbf4b59dca1778be3bb014124011221a492147d4c492584e87af23e2f842ca6307641b3919f67a3f27f09312c0')

prepare() {
    sed -e 's:$(CCFLAGS):& $(CFLAGS):' \
        -e 's:$(LNFLAGS):& $(LDFLAGS):' \
        -e 's:-Werror ::' -e 's:-ggdb -O0::' \
        -i src/makefile
}

build() {
    cd src
    make
}

package() {
    install -Dm755 src/tpm_server -t "${pkgdir}"/usr/bin/
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
