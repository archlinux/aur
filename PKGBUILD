# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=packetbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.2.1
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
sha256sums=('e45629a37d5c305efa26e2b6a68561528762081681e547e312bb058cbff76125')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_i686=('ac4a396f566dbf38b39bc3ef4da3a1dbd69c97f53678048d3508782d4722ee5c')
sha256sums_x86_64=('2a519f720bed5dee0e37ec82d24197409b2bf147218abde86c58d325ac7d83ba')

package() {
    cd "$srcdir/$_pkgbase-$pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
