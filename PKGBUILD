# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=topbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.0.0_rc2
_pkgver=${pkgver/_/-}
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
sha256sums=('62f5b613d9464e4d8b1074c1a54b95cbd1c6615f0c788f1d9093becbdbc6c45d')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-x86_64.tar.gz")
sha256sums_i686=('e32035d34a40af343df5008174040839be2a3d2358521ed7efc030e7c7b59e0a')
sha256sums_x86_64=('bf23778a7d492e39bd4b166fcaf81152bc816c6503ebef45e8aba1927561898e')

package() {
    cd "$srcdir/$_pkgbase-$_pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
