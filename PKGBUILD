# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

pkgname="cryptopro-csp-k1"
pkgver=4.0.9963
# pkgver is not allowed to contain forward slashes
_pkgver_patch="5"
_pkgver="$pkgver-$_pkgver_patch"
pkgrel=0
pkgdesc='CryptoPro CSP 4.0'
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
    'linux-amd64.tgz'
    'cades_linux_amd64.tar.gz'
)
md5sums=(
    'eba649ae2c974a8c9d0cd69d2b508ae7'
    '31672759fe0eddb89484c18c3e1676e1'
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
    bsdtar -xf "cprocsp-rdr-jacarta-64-3.6.408.695-4.x86_64.rpm" -C "$pkgdir"

    cd "$srcdir/cades_linux_amd64"
    bsdtar -xf "cprocsp-pki-2.0.0-amd64-cades.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-pki-2.0.0-amd64-plugin.rpm" -C "$pkgdir"

    rm -r "$pkgdir/etc/init.d/"
    mv "$pkgdir/tmp/" "$pkgdir/opt/cprocsp/tmp/"
    rm -r "$pkgdir/usr/lib64/"

    mkdir -p "$pkgdir/etc/ld.so.conf.d/"
    echo "/opt/cprocsp/lib/amd64" > "$pkgdir/etc/ld.so.conf.d/cryptopro-csp-k1.conf"
}
