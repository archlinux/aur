# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=topbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.3.1
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
sha256sums_i686=('5f05b26d418b10057ce3251503febad934f70dce309f35e3fb097294a4dba5d1')
sha256sums_x86_64=('e1c313a0f8f61eb12dcb262f5352a621aa33c0234c8516176411638ee2114b1e')

package() {
    cd "$srcdir/$_pkgbase-$pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
