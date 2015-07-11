# Maintainer: James An <james@jamesan.ca>

_pkgname=search_api_solr
pkgname=solr-conf-drupal
pkgver=7.x_1.8
pkgrel=2
pkgdesc="Configuration files to enable Drupal to use Solr as its search provider"
arch=('i686' 'x86_64' 'any')
url="http://drupal.org/project/$_pkgname"
license=('GPL')
depends=('solr>=5')
optdepends=(
  'drupal: Solr client for these configuration files'
  'aegir: meta-Drupal hosting platform'
)
source=(
  "http://ftp.drupal.org/files/projects/$_pkgname-${pkgver/_/-}.zip"
  'mapping-ISOLatin1Accent.txt' # From the solr 5.2.1 source tarball: solr-5.2.1/server/solr/configsets/sample_techproducts_configs/conf
)
md5sums=('ea3f8918a37f5d581def933921870e2d'
         '9f3c8a60a4f09327fad22aeff082c2b3')

package() {
  cd "$_pkgname/solr-conf/5.x"

  for file in *; do
    install -Dm644 $file "$pkgdir/etc/solr/drupal/conf/$file"
  done
  install -Dm644 "$srcdir/mapping-ISOLatin1Accent.txt" "$pkgdir/etc/solr/drupal/conf/mapping-ISOLatin1Accent.txt"

  chown 521:521 "$pkgdir/etc/solr/drupal"
}
