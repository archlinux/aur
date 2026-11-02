# Maintainer: xTom <packages@xtom.com>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=rdap-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="RDAP (Registration Data Access Protocol) client and API server - prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/xtomcom/rdap"
license=('MIT')
depends=('gcc-libs')
provides=('rdap')
conflicts=('rdap')
backup=('etc/default/rdap')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/rdap_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/rdap_${pkgver}_arm64.deb")
sha256sums_x86_64=('3fe2a40f161002d464a3e586a7fc8c2f9a580c012caa76bb6fe9b715e876dfbf')
sha256sums_aarch64=('70ca23c890386a3fbcb45eb48c11586cee858610be04e5886c45ecb757d5e1d4')

package() {
    cd "$srcdir"

    # Extract deb package
    bsdtar -xf data.tar.*

    # Install files
    install -Dm755 usr/bin/rdap "$pkgdir/usr/bin/rdap"
    install -Dm644 usr/lib/systemd/system/rdap.service "$pkgdir/usr/lib/systemd/system/rdap.service"
    install -Dm600 etc/default/rdap "$pkgdir/etc/default/rdap"
}
