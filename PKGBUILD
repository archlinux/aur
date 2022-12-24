# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

# README
#
# Ru
# ==
# Тиражирование и распространение СКЗИ является деятельностью
# лицензируемой ФСБ России. Каждый экземпляр СКЗИ должен иметь
# индивидуальный номер учета. Т.е. анонимный доступ невозможен.
# AUR не выполняет оба этих пункта. Поэтому перед выполнением makepkg
# необходимо скачивать СКЗИ самостоятельно с сайта производителя. Ссылка:
#
# https://cryptopro.ru/sites/default/files/private/csp/50/12600/linux-amd64.tgz
#
# Данный PKGBUILD старается следовать последней не-сертифицированной версии CSP (не RC).
#
# En
# ==
# This PKGBUILD does not automatically download CSP archive because
# accessing it requires logging in. Please download the archive manually
# and place alongside the PKGBUILD before building. Link:
#
# https://cryptopro.ru/sites/default/files/private/csp/50/12600/linux-amd64.tgz
#
# This PKGBUILD tracks the latest not-certified version of CSP (not RC).

pkgname="cryptopro-csp-k1"
pkgver=5.0.12600
pkgrel=1
_pkgver_patch="6"
_cades_version="2.0.14660"
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
    'linux-amd64.tgz' # download from https://cryptopro.ru/sites/default/files/private/csp/50/12600/linux-amd64.tgz
)
sha256sums=('3414afc826241a3e7a0cc4c188ccbca5100c37a7b2e98e5b650194b091b912e9')
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
    
    # browser plugin
    bsdtar -xf "cprocsp-pki-cades-64-${_cades_version}-1.amd64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-pki-plugin-64-${_cades_version}-1.amd64.rpm" -C "$pkgdir"

    rm -r "$pkgdir/etc/init.d/"
    rm -r "$pkgdir/usr/lib64/"

    mkdir -p "$pkgdir/etc/ld.so.conf.d/"
    echo "/opt/cprocsp/lib/amd64" > "$pkgdir/etc/ld.so.conf.d/cryptopro-csp-k1.conf"
}
