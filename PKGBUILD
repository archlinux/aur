# Maintainer: Sabart Otto - Seberm <seberm[at]seberm[dot]com>

pkgname=wwwsqldesigner
pkgver=2.7
pkgrel=1
pkgdesc="Visual web-based SQL modelling tool"
url="http://code.google.com/p/wwwsqldesigner/"
license=('BSD')
arch=('any')
depends=()
optdepends=('apache')
install=wwwsqldesigner.install
makedepends=('subversion')
source=("http://wwwsqldesigner.googlecode.com/files/${pkgname}-${pkgver}.zip")

package() {
  _instdir="$pkgdir/usr/share/webapps/$pkgname"
  mkdir -p "$_instdir" "$pkgdir/etc/webapps/$pkgname" "$pkgdir/etc/httpd/conf/extra"

  cp -ra $srcdir/${pkgname}-${pkgver}/* "$_instdir/"
  chmod 0644 -R "$_instdir"

  # It's similar to phpMyAdmin
  cat >$pkgdir/etc/webapps/$pkgname/apache.example.conf <<EOF
    Alias /${pkgname} "/usr/share/webapps/${pkgname}"
    <Directory "/usr/share/webapps/${pkgname}">
    	AllowOverride All
    	Options FollowSymlinks
		Require all granted
    </Directory>
EOF

  cp "$pkgdir/etc/webapps/$pkgname/apache.example.conf" "$pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf"
  #echo "Include conf/extra/httpd-${pkgname}.conf" >> $pkgdir/etc/httpd/conf/httpd.conf

  find "${_instdir}" -type d -exec chmod 755 {} \;
}

sha1sums=('3bc7a0a96be57a9c137f511b547759822aba8a13')
