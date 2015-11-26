# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=packetbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.0.0
pkgrel=1
pkgdesc='An open source network packet analyzer that ships data to Elasticsearch (precompiled)'
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/beats/$_pkgbase"
license=('APACHE')
backup=("etc/$_pkgbase/$_pkgbase.yml")
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=('packetbeat')
conflicts=('packetbeat')
source=("$_pkgbase.service")
sha256sums=('09420676932fd4292351c9b55e835c545013477d015b7ffe8d5009ed1984da64')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_i686=('d6dbfe8971666419118d98592b081aec3ac43f96871f7092f311a79be34e54a8')
sha256sums_x86_64=('7a02dc6a1665e957a7b5dc6650482d246aba84577112cb71cabe118e6dd15849')

package() {
    cd "$srcdir/$_pkgbase-$pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
