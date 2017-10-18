# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Tom Richards <tom@tomrichards.net>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: David Danier <david.danier@team23.de>

pkgname=solr
pkgver=7.1.0
pkgrel=1
pkgdesc="Popular, blazing fast open source enterprise search platform from the Apache Lucene project"
arch=('any')
license=('Apache')
url="http://lucene.apache.org/solr/"
depends=('java-runtime-headless>=8')
source=("http://archive.apache.org/dist/lucene/$pkgname/$pkgver/solr-$pkgver.tgz"{,.asc}
        "solr.service"
        "solr.sysusers")
backup=(opt/solr/server/etc/jetty{,-http,-https,-ssl}.xml
        opt/solr/server/etc/webdefault.xml
        opt/solr/server/solr/solr.xml
        opt/solr/server/solr/zoo.cfg)
install="$pkgname.install"
options=(!strip)
validpgpkeys=('38D2EA16DDF5FC722EBC433FDC92616F177050F6') # Shalin Shekhar Mangar (CODE SIGNING KEY) <shalin@apache.org>
sha256sums=('5cd25cc2634e47efbb529658d6ddd406a7cd1b211affa26563a28db2d80b8133'
            'SKIP'
            'e4ca86de2ef9425913280deeeec42d6e8ff310b08ea55d9156193ceef3c847bd'
            'a336c1a16742b100b3d28fe49722366477bb805e262f36b83cc2fdd9e85d5bf9')
build() {
  cd "$srcdir/$pkgname-$pkgver"/bin
  rm *.cmd
  rm install_solr_service.sh
  rm -rf init.d
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir"/opt/solr
  cp -R * "$pkgdir"/opt/solr
  chown -R 114:114 "$pkgdir"/opt/solr
  install -Dm644 "$srcdir/solr.service" "$pkgdir/usr/lib/systemd/system/solr.service"
  install -Dm644 "$srcdir/solr.sysusers" "$pkgdir/usr/lib/sysusers.d/solr.conf"
}
