# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=kibana-bin
pkgver=8.4.2
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
sha512sums_i686=('3145d2a5a63275c0e6a6ebe1bda8a26e51eb540014bf1f742549b0238d69983df5e91cf28b55cdaff657b0cc401e2b8beeb07606dcf86ff8383b983f010f2e1f')
sha512sums_x86_64=('f42e0b1835b521e961261e2b9543174155cda41d95a9b129f158ae9e967dcd31c0cd563924c27007348213310c19866a61540a89f8fbdac18db51cece00aba52')
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
