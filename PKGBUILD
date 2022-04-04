# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=kibana-bin
pkgver=8.1.2
pkgrel=1
pkgdesc='Explore and visualize your Elasticsearch data'
arch=('i686' 'x86_64')
url='https://www.elastic.co/kibana'
license=('custom:Elastic')
backup=('etc/kibana/kibana.yml')
depends=('nodejs')
optdepends=('elasticsearch: for running standalone installation')
source_i686=("https://artifacts.elastic.co/downloads/kibana/kibana-$pkgver-arm64.deb")
source_x86_64=("https://artifacts.elastic.co/downloads/kibana/kibana-$pkgver-amd64.deb")
source=(
    'kibana.sysusers'
    'kibana.tmpfiles'
)
sha512sums_i686=('2c0809dbeabedea13268aacaf7d4983ea18da12aec24433cb27a54229c21180d7d01f3bcbe59a9bdcda95d0d324f0a8de4b79c81808a36e2a1b13caf52133aa6')
sha512sums_x86_64=('503ade4f582ded02af0632e6264d9cb661cafea8b567f7c0490370a5e2fa4b00cd636eded74a54c771b34e48eec42f7d91340f1fdaa06fca6bac3160b2df1934')
sha512sums=(
    '1ba7f466d2d10bd320bb69deb0ff8a5a6c51be991f9683186d2cd16aca28d560ee9941da27c11a819c7ee1be3e5e2d133b7848b13c359d170f492c107080afbe'
    '8882e23e475c10e3560008ce0239612b30fcdec955e459c27e9c90b3b972af3d96955387865c2e312f1d87addba5322f939715438562051f5999c8455c83c2dd'
)

prepare() {
    tar -xf data.tar.gz
    rm -rf usr/lib/tmpfiles.d
}

package() {
    install -Dm644 kibana.sysusers "$pkgdir/usr/lib/sysusers.d/kibana.conf"
    install -Dm644 kibana.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kibana.conf"
    cp -r etc usr "$pkgdir/"
}
