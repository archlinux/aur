# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=librespot-git
_pkgname=librespot
pkgver=357.ddfc28f
pkgrel=2
epoch=1
pkgdesc="An open source client library for Spotify."
arch=('i686' 'x86_64')
url="https://github.com/plietar/librespot"
license=('MIT')
depends=('rust' 'protobuf')
makedepends=('git' 'cargo')
provides=('librespot')
conflicts=('librespot')
source=('git+https://github.com/plietar/librespot'
        'librespot.conf')
sha256sums=('SKIP'
            '3d48207e0be5cf2e68a9ecfd8f418aa1d71fa7f97d562780aa73d2db1a46cac5')

pkgver()
{
    cd "$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
    cd "$_pkgname"
    cargo build \
        --no-default-features \
        --features alsa-backend \
        --release
}

package()
{
    install -D -m 755 "$_pkgname"/target/release/librespot \
        "$pkgdir"/usr/bin/librespot
    install -D -m 644 "$_pkgname"/contrib/librespot.service \
        "$pkgdir"/usr/lib/systemd/system/librespot.service
}
