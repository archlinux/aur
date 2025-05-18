# Contributor: Martin Schrodt <martin@schrodt.org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=cubesql
pkgdesc='cubeSQL is a relational database management system built on top of the sqlite database engine.'
pkgver=5.9.6
pkgrel=1
arch=('x86_64')
url='http://www.sqlabs.com/cubesql.php'
license=('custom:cubesql')
optdepends=('gtk3')
source=("$pkgname-$pkgver.tgz::https://www.sqlabs.com/download/cubesql/latest/cubesql_linux64bit.tar.gz"
	'cubesql.service'
	'cubesql-admin'
	'cubesql-sysusers.conf'
	'cubesql-tmpfiles.conf'
    'cubesql.desktop')
sha256sums=('131adcfe1d935f1a676721ca25b3876b37449230e1adb012a54cb702d9b76571'
            '3bfe6eec238b33581f9441be552b34a875b8dac783314d0efaec6dd3992be490'
            'dec44ae33559e89061db90177322d3e9a289df64da1b1287df3bd47379b6a8b5'
            'bf57a4e0ec18559a3de8457e07262aece9cf27995af84a561f56f7ff84dfb88f'
            '0cd36e0d6bace234c454d1b66a2ed843de6b883900915165a19f5bc4bda7fd97'
            '32014ebb12363bff1474ea1959157988f3e11609a495553b8db6d7b656bc66aa')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/cubesql
  mkdir -p $pkgdir/usr/lib/cubesql
  
  install -D -m644 cubesql.service -t "$pkgdir/usr/lib/systemd/system"
  install -D -m644 cubesql-sysusers.conf "$pkgdir/usr/lib/sysusers.d/cubesql.conf"
  install -D -m644 cubesql-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/cubesql.conf"
  install -D -m755 cubesql-admin -t "$pkgdir/usr/bin"
  install -Dm644 cubesql.desktop -t "$pkgdir/usr/share/applications"
    
  cd $srcdir/cubesql_64bit/data
  cp cubesql $pkgdir/usr/bin/cubesql
  cp Documentation/* $pkgdir/usr/share/doc/cubesql
  
  cp -r cubeSQLAdmin/* $pkgdir/usr/lib/cubesql
}
 
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
