# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.0.0_beta4
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='Collects, pre-processes, and forwards log files from remote sources (precompiled)'
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/beats"
license=('APACHE')
backup=("etc/$_pkgbase/$_pkgbase.yml")
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase.service")
sha256sums=('9985f8e0441efde0e60c5efe97890e46d4f1cbd118d8722eb478be876197326a')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-x86_64.tar.gz")
sha256sums_i686=('35fdb23034fec5261cea2e30adf819bdfb0e700396ec15022db56fedc079aff3')
sha256sums_x86_64=('9fec521157fe6cf8b1f9d6ce4e142521a742b7fe2c585d5ae14ba21b67604235')

package() {
    cd "$srcdir/$_pkgbase-$_pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
