# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=kibana-bin
pkgver=8.1.1
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
sha512sums_i686=('e664de64368b259f83c42e316eda1078fde21eb7b6f50b3d6010c3ff95ac62ab6cca7926d2befc27cf3ee748491b8a20c80fecb0ab156bd4d99e5b578c14e86a')
sha512sums_x86_64=('0e372938c45a826fff320cc00ce52ad984e6e9e2375dbb8e6b73b52cb31c92de183591489714a2fad30ab1a4d2372b4dee99676df990fa7ce34e7774a566b1b7')
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
