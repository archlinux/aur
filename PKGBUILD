# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=ibm-sw-tpm2
pkgver=1332
pkgrel=1
pkgdesc="An implementation of the TCG TPM 2.0 specification by IBM"
arch=(x86_64)
url="https://sourceforge.net/projects/ibmswtpm2/"
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm${pkgver}.tar.gz")
sha256sums=('8e8193af3d11d9ff6a951dda8cd1f4693cb01934a8ad7876b84e92c6148ab0fd')

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
