# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: Piotr Sarna <piotr@sarna.dev>

pkgname=redpanda-bin
pkgver=26.1.6
pkgrel=1
pkgdesc='Redpanda is a streaming platform for mission critical workloads (binary package)'
arch=('x86_64' 'aarch64')
url='https://github.com/redpanda-data/redpanda'
license=('custom')
optdepends=()
conflicts=('redpanda-git' 'redpanda')
replaces=('redpanda-git' 'redpanda')
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip)
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-arm64.zip)
sha256sums_x86_64=('bd018d75c6ba99f40d54086279b719d7c6101c734a01bdd14815e8c8c7b7dd8c')
sha256sums_aarch64=('325a62c10e104f9b26190f3a87346a799eb79d4d1c33ec54b0b95210fbb564f3')
noextract=(${pkgname}-${pkgver}-x86_64.zip ${pkgname}-${pkgver}-aarch64.zip)

prepare() {
    mkdir -p redpanda-bin
    bsdtar -xf "${pkgname}-${pkgver}-$CARCH.zip" -C redpanda-bin
    chmod +x redpanda-bin/rpk
}

package() {
    install -Dm0755 "$pkgname/rpk" "$pkgdir/usr/bin/rpk"
}
