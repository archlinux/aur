# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno-bin
_pkgname=bruno
pkgdesc="Opensource API Client for Exploring and Testing APIs"
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
provides=('bruno')
conflicts=('bruno')
depends=(
    'c-ares'
    'gtk3'
    'libevent'
    'nss'
    'wayland'
    'alsa-lib'
)

# _latest function is used in a script that will auto update this PKGBUILD.
_latest() {
    curl -s https://api.github.com/repos/usebruno/bruno/releases | jq -r '.[0].tag_name'
}

source=(
    "https://github.com/usebruno/bruno/releases/download/v${pkgver}/bruno_${pkgver}_amd64_linux.deb"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/usebruno/bruno/v${pkgver}/license.md"
)

package() {
    cd $pkgdir

    tar -vxf $srcdir/data.tar.xz

    mkdir -p usr/bin
    ln -sf /opt/Bruno/bruno usr/bin/bruno

    install -D -m0644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

sha256sums=(
    c82608d9cf4cd7d775f81a6733b6092e4664f15762c7e6125826b9aac08c071c
    8891070a847e5047bf77d38d88d7dfbab1beab41e37c802b9f5b23f2bbb9c7be
)
