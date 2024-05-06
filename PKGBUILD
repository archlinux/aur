# Maintainer: taotieren <admin@taotieren.com>

pkgname=thunder-nas-bin
pkgver=1.0.3
pkgrel=0
pkgdesc="Synology NAS thunder run on Linux"
arch=(aarch64
    x86_64)
url="https://github.com/gngpp/thunder"
license=('MIT')
provides=(${pkgname%-nas-bin} ${pkgname%-bin})
conflicts=(${pkgname%-nas-bin} ${pkgname%-bin})
replaces=()
depends=()
makedepends=()
backup=()
options=('!strip' '!debug' '!lto')
install=$pkgname.install
source=(
    "$pkgname.install"
    "thunder-${pkgver}-aarch64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/thunder-${pkgver}-aarch64-unknown-linux-musl.tar.gz"
    "thunder-${pkgver}-x86_64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/thunder-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('b1578a3a34e201c77fe8a43b36b5fa4a97d25e8821d4b47d4f4eb70ae7357a39'
            '401bbfad610f587d8b70dd647985dcc4397052a857246de128ee114a72c10fd4'
            '2c10dd081bdb5707498575bc8273d80028467b0359d1bba93430d8ffeaa06f77')
noextract=(thunder-${pkgver}-aarch64-unknown-linux-musl.tar.gz
    thunder-${pkgver}-x86_64-unknown-linux-musl.tar.gz)

package() {
    install -dm755 "${pkgdir}/usr/bin"
    if [ $CARCH = x86_64 ]; then
        bsdtar -xf ${srcdir}/thunder-${pkgver}-x86_64-unknown-linux-musl.tar.gz -C "${pkgdir}/usr/bin"
    elif [ $CARCH = aarch64 ]; then
        bsdtar -xf ${srcdir}/thunder-${pkgver}-aarch64-unknown-linux-musl.tar.gz -C "${pkgdir}/usr/bin"
    fi
}
