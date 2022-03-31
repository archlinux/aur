# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

pkgname="cryptopro-csp-k1"
pkgver=5.0.12417
pkgrel=2
_pkgver_patch="6"
_cades_version="2.0.14530"
_pkgver="$pkgver-$_pkgver_patch"
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
    'linux-amd64.tgz' # download from https://cryptopro.ru/sites/default/files/private/csp/50/12417/linux-amd64.tgz
    'cades-linux-amd64.tar.gz' # download from https://www.cryptopro.ru/products/cades/plugin
)
sha256sums=('99b00c9300b2ec81e1d6b7e7b3f3c77753d23b65d724d1ea9e9d8407b59e165c'
            'bb9e43ab7cc8c51d6f41ad4f810c27695278c91fe5cf4cf8fe5bfcf241583a64')
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
    bsdtar -xf "cprocsp-rdr-cloud-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-devel-${_pkgver}.noarch.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-curl-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"

    cd "$srcdir"
    bsdtar -xf "cprocsp-pki-cades-64-${_cades_version}-1.amd64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-pki-plugin-64-${_cades_version}-1.amd64.rpm" -C "$pkgdir"

    rm -r "$pkgdir/etc/init.d/"
    rm -r "$pkgdir/usr/lib64/"

    mkdir -p "$pkgdir/etc/ld.so.conf.d/"
    echo "/opt/cprocsp/lib/amd64" > "$pkgdir/etc/ld.so.conf.d/cryptopro-csp-k1.conf"
}
