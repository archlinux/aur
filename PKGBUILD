# Maintainer: Piotr Sarna <piotr@sarna.dev>

pkgname=redpanda-bin
pkgver=23.3.2
pkgrel=1
pkgdesc='Redpanda is a streaming platform for mission critical workloads (binary package)'
arch=('x86_64' 'aarch64')
url='https://github.com/redpanda-data/redpanda'
license=('custom')
depends=('gnutls' 'numactl' 'c-ares' 'hwloc' 'snappy' 'lz4' 'zstd' 'fmt' 'xxhash' 'yaml-cpp' 'protobuf' 'crypto++')
optdepends=()
conflicts=('redpanda-git' 'redpanda')
replaces=('redpanda-git' 'redpanda')
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip)
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-arm64.zip)
sha256sums_x86_64=('d7595e59c43ad4f2b65bf646991ea1f2a3abf98bc503b71b503227dc6734ffc2')
sha256sums_aarch64=('805cd7d67cb6d8da11075e52ef28143816ce1bfeeb1c6732b035ae709af990b6')
noextract=(${pkgname}-${pkgver}-x86_64.zip ${pkgname}-${pkgver}-aarch64.zip)

prepare() {
    mkdir -p redpanda-bin
    bsdtar -xf "${pkgname}-${pkgver}-$CARCH.zip" -C redpanda-bin
    chmod +x redpanda-bin/rpk
}

package() {
    install -Dm0755 "$pkgname/rpk" "$pkgdir/usr/bin/rpk"
}
