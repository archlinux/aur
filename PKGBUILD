# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=topbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.1.2
pkgrel=1
pkgdesc='An open source server monitoring agent that stores metrics in Elasticsearch (precompiled)'
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/beats"
license=('APACHE')
backup=("etc/$_pkgbase/$_pkgbase.yml")
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase.service")
sha256sums=('ac768b039c699c63a3cda17518f3a2ec0481dff23e6366f6fb452c819bd5825b')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_i686=('c75d9e16ea8308cec9adc3075ada608c01e3ee02a0849f008ca66db7d54e6d4d')
sha256sums_x86_64=('03017d96a51d47dd4eb7136cf4c2541d3cfed7dd27344bf12bae7949a5dad17e')

package() {
    cd "$srcdir/$_pkgbase-$pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
