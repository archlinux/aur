# Maintainer: thorko contact@thorko.de
pkgname=roundcube
pkgver=1.6.0
pkgrel=1
pkgdesc="Roundcubemail"
arch=('x86_64')
url='https://roundcube.net'
license=('GPL')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/roundcube/roundcubemail/releases/download/${pkgver}/roundcubemail-${pkgver}-complete.tar.gz")
sha256sums_x86_64=('2409ccdfe2e465f086cb9fc18c88dfe0aaf6ccc23924564975061209921694ba')

source=('apache.conf')
sha256sums=('325667a4fd5658a9b5543ddc94a263306b594d13cfa8713f710e9a5cc9538201')


package() {
  mkdir -p "$pkgdir"/etc/webapps/roundcube
  mkdir -p "$pkgdir"/usr/share/webapps
  cd "$pkgdir"/usr/share/webapps
  cp -ra "$srcdir"/roundcubemail-${pkgver} roundcube
  cd roundcube

  # link ocnfigs
  mv .htaccess "$pkgdir"/etc/webapps/roundcube/
  ln -s /etc/webapps/roundcube/.htaccess .htaccess

  mv config "$pkgdir"/etc/webapps/roundcube/
  ln -s /etc/webapps/roundcube/config config
  chown http:http "$pkgdir"/etc/webapps/roundcube/config/config.inc.php.sample
  chown http:http "$pkgdir"/etc/webapps/roundcube/.htaccess
  install -Dm0644 -o http -g http "$srcdir/apache.conf" "${pkgdir}/etc/webapps/roundcube/apache.conf.sample"
}
