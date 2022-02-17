# Maintainer: Luke Arms <luke@arms.to>

pkgname=db2-odbc-cli
pkgver=11.5.5.0
pkgrel=2
pkgdesc='IBM Data Server Driver for ODBC and CLI'
arch=('x86_64')
url='https://www.ibm.com/support/pages/db2-odbc-cli-driver-download-and-installation-information'
license=('custom:IBM IPLA')
depends=('audit' 'gcc-libs' 'glibc' 'icu' 'libcap-ng' 'pam' 'xz' 'zlib' 'libxml2' 'libcrypt.so.1')
source=("https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/linuxx64_odbc_cli.tar.gz")
sha256sums=('64171abacfa8c27bcc09ef963d5f3340a8e351c2d4c0809c3fdda694bed195d2')

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
