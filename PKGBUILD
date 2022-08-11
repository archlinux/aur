# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=kibana-bin
pkgver=8.3.3
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
sha512sums_i686=('6fd462481ba6dad546aaf067f4db2928701fe29d49d5765357c223576a6299c2831ef2ebefc5fb942d0334c4c0ac742e92ae976399f5015ea1bbaf2af6b41610')
sha512sums_x86_64=('f19079eba204ddb9ba14625c61830a8bcdfa0e2d2cd414c7de1d62cb88d79cad7d6e47c54907a42b7651841cf96900e1c1383a7d4d5ef601ccfbe95a03dc1873')
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
