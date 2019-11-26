# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

pkgname="cryptopro-csp-k1"
pkgver=5.0.11455
# pkgver is not allowed to contain forward slashes
_pkgver_patch="5"
_pkgver="$pkgver-$_pkgver_patch"
pkgrel=0
pkgdesc='CryptoPro CSP 5.0'
arch=('x86_64')
url='https://cryptopro.ru/products/cryptopro-csp'
license=('proprietary')
depends=(
    'glibc'
    'gcc-libs'
    'gtk2'
    'gdk-pixbuf2'
    'pango'
    'atk'
    'glib2'
    'curl'
    'pcsclite'
    'libxml2'
    'ccid'
    'acsccid'
)
makedepends=(
    'libarchive'
)
# Direct links to sources download:
# https://www.cryptopro.ru/sites/default/files/private/csp/50/11455/linux-amd64.tgz
# https://www.cryptopro.ru/sites/default/files/products/cades/current_release_2_0/cades_linux_amd64.tar.gz
source=(
    'linux-amd64.tgz'
    'cades_linux_amd64.tar.gz'
)
md5sums=(
    'b87bbe581d2431c71b8ec79f4bf7303b'
    'e0fa664ce9fba1b38e8a6c2b3e0c419c'
)
install=cryptopro-csp-k1.install
options=(!strip)

package() {
    cd "$srcdir/linux-amd64"
    bsdtar -xf "lsb-cprocsp-base-${_pkgver}.noarch.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-rdr-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-kc1-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-capilite-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-ca-certs-${_pkgver}.noarch.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-gui-gtk-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-pcsc-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-jacarta-64-5.0.0.1148-4.x86_64.rpm" -C "$pkgdir"

    cd "$srcdir/cades_linux_amd64"
    bsdtar -xf "cprocsp-pki-2.0.0-amd64-cades.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-pki-2.0.0-amd64-plugin.rpm" -C "$pkgdir"

    rm -r "$pkgdir/etc/init.d/"
    mv "$pkgdir/tmp/" "$pkgdir/opt/cprocsp/tmp/"
    rm -r "$pkgdir/usr/lib64/"

    mkdir -p "$pkgdir/etc/ld.so.conf.d/"
    echo "/opt/cprocsp/lib/amd64" > "$pkgdir/etc/ld.so.conf.d/cryptopro-csp-k1.conf"
}
