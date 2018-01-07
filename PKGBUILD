# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=punbb
pkgver=1.4.4
pkgrel=1
pkgdesc="forum engine"
arch=('any')
url="http://punbb.informer.com"
license=("GPL")
depends=('php')
backup=('etc/webapps/punbb/.htaccess')
source=(http://punbb.informer.com/download/$pkgname-$pkgver.zip
        pun_antispam-$pkgver.tgz::http://punbb.informer.com/extensions/pun_antispam/pun_antispam.tgz)
md5sums=('86cd3ae531e2589e25eac3ccf78f460e'
         'a0c33628608e429345a0eef789db68ac')

package() {
  cd "$srcdir"
  install -dm0755 "$pkgdir"/usr/share/webapps
  install -dm0755 "$pkgdir"/etc/webapps/punbb
  install -dm0755 "$pkgdir"/var/lib
  install -dm0755 "$pkgdir"/var/cache

  cp -r punbb-$pkgver "$pkgdir"/usr/share/webapps/punbb
  cp -r "$srcdir"/pun_antispam "$pkgdir"/usr/share/webapps/punbb/extensions

  cd "$pkgdir"/usr/share/webapps/punbb

  echo "deny from all" >"$pkgdir"/etc/webapps/punbb/.htaccess
  ln -s /etc/webapps/punbb/.htaccess .htaccess

  mv img/avatars "$pkgdir"/var/lib/punbb
  ln -s /var/lib/punbb img/avatars
  mv cache "$pkgdir"/var/cache/punbb
  ln -s /var/cache/punbb cache

  cd "$pkgdir"
  find -type d -exec chmod 0755 {} \;
  find -type f -exec chmod 0644 {} \;
  chown http:http "$pkgdir"/var/{lib,cache}/punbb
}
