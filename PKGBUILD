# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=kibana-bin
pkgver=8.1.3
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
sha512sums_i686=('4e07a8da34d90cf29f7cbaf03593157e04221f7e402a284f60755d59fe2cdb6b2319b80a74356d06d862a6f9f04aeb0183e5563501f83eb691e68a2dfd0a95ab')
sha512sums_x86_64=('e8a31d895a9f34478b82755d494dc69a77cb311e203f2ba04db18bc48967e52e457a1814855bd39996b42c4b2e9c12d7164ffadee2635941735ec229dfbe9b70')
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
