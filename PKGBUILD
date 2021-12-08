# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

pkgname="cryptopro-csp-k1"
pkgver=5.0.12330
# pkgver is not allowed to contain forward slashes
_pkgver_patch="6"
_pkgver="$pkgver-$_pkgver_patch"
pkgrel=2
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
source=(
    'linux-amd64.tgz' # download from https://cryptopro.ru/sites/default/files/private/csp/50/12330/linux-amd64.tgz
    'cades_linux_amd64.tar.gz' # download from https://www.cryptopro.ru/products/cades/plugin
)
sha256sums=('51ccdbb330d8c5f8ec4566bb72bd85fc0daecf7b47bed6c6c1af84879a20b1e1'
            'f0c9e288620f85b7ee175d31cefacd73434632d5a07fab1e5cc25847de78bcaa')
install=cryptopro-csp-k1.install
options=(!strip)

package() {
    cd "$srcdir/linux-amd64"
    bsdtar -xf "lsb-cprocsp-base-${_pkgver}.noarch.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-rdr-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-kc1-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-capilite-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-ca-certs-${_pkgver}.noarch.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-pkcs11-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-gui-gtk-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-pcsc-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-jacarta-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-rutoken-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-cptools-gtk-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"

    cd "$srcdir"
    bsdtar -xf "cprocsp-pki-cades-64-2.0.14458-1.amd64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-pki-plugin-64-2.0.14458-1.amd64.rpm" -C "$pkgdir"

    rm -r "$pkgdir/etc/init.d/"
    rm -r "$pkgdir/usr/lib64/"

    mkdir -p "$pkgdir/etc/ld.so.conf.d/"
    echo "/opt/cprocsp/lib/amd64" > "$pkgdir/etc/ld.so.conf.d/cryptopro-csp-k1.conf"
}
