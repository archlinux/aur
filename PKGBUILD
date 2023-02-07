# Maintainer: Luke Arms <luke@arms.to>

pkgname=db2-odbc-cli
# Mentioned in clidriver/license/UNIX/odbc_LI_en
pkgver=11.5.8.0
pkgrel=1
pkgdesc='IBM Data Server Driver for ODBC and CLI'
arch=('x86_64')
url='https://www.ibm.com/support/pages/db2-odbc-cli-driver-download-and-installation-information'
license=('custom:IBM IPLA')
depends=('audit' 'gcc-libs' 'glibc' 'icu' 'libcap-ng' 'pam' 'xz' 'zlib' 'libxml2' 'libxcrypt-compat')
source=("linuxx64_odbc_cli-$pkgver.tar.gz::https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/linuxx64_odbc_cli.tar.gz")
sha256sums=('3f769024dcc10893b648dc588e70f0cdc9078bbce9eb1cc873baa6e106fbd37c')

package() {
    local f
    install -d "$pkgdir/opt"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cd "$srcdir"
    for f in clidriver/license/UNIX/odbc_LI_*; do
        install -m 0644 "$f" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-${f##*/odbc_LI_}.txt"
    done
    mv "$pkgdir/usr/share/licenses/$pkgname"/LICENSE{-en,}.txt
    for f in clidriver/license/odbc_*; do
        install -m 0644 "$f" "$pkgdir/usr/share/licenses/$pkgname/${f##*/odbc_}"
    done
    rm -rf clidriver/{license,db2dump}
    mv -T clidriver "$pkgdir/opt/$pkgname"
}
