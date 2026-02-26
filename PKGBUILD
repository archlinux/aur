# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: Piotr Sarna <piotr@sarna.dev>

pkgname=redpanda-bin
pkgver=25.3.8
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
sha256sums_x86_64=('497956ee3b2a489efd0369695a50385ee4970cb9f6f4b80d92f4c3a39a2d4e1e')
sha256sums_aarch64=('96a48ab89bbeaa0f1a64e326aa67434cd8987e9ac420bcd9fb44121b4dd5bb8f')
noextract=(${pkgname}-${pkgver}-x86_64.zip ${pkgname}-${pkgver}-aarch64.zip)

prepare() {
    mkdir -p redpanda-bin
    bsdtar -xf "${pkgname}-${pkgver}-$CARCH.zip" -C redpanda-bin
    chmod +x redpanda-bin/rpk
}

package() {
    install -Dm0755 "$pkgname/rpk" "$pkgdir/usr/bin/rpk"
}
