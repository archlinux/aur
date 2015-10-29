# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=packetbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.0.0_beta4
_pkgver=${pkgver/_/-}
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

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-x86_64.tar.gz")
sha256sums_i686=('6e654294ab2ef2f58c4f65d0f115dba1246ff665aee3320e2961a66759618869')
sha256sums_x86_64=('1e7ed50f44ed44e38b184c220ff75ebff6f9e5fcc82688c78e2b52478f8e6b35')

package() {
    cd "$srcdir/$_pkgbase-$_pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
