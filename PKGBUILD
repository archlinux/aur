# Maintainer: Allen Zhong <moeallenz@gmail.com>
pkgname=asar-apache
pkgver=r40
pkgrel=2
pkgdesc="A System Activity Reporter of apache httpd"
arch=(i686 x86_64)
url="http://code.google.com/p/python-asar/"
license=('GPL2')
depends=('apache')
source=("http://python-asar.googlecode.com/svn-history/$pkgver/trunk/asar-apache-agent/asar_apache_agent.c"
	"http://python-asar.googlecode.com/svn-history/$pkgver/trunk/asar-apache-agent/asar_apache_gather.c")
md5sums=('ae8af0c209828408496c8a09adf51102'
         '5fdf7a14172fb6ed70c707231e57c359')

build() {
  cd "$srcdir"

  sed -i 's/\/tmp/\/var\/log\/httpd/g' *.c
  gcc -o asar_apache_agent asar_apache_agent.c
  gcc -o asar_apache_gather asar_apache_gather.c
}

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/sbin
  install -Dm755 asar_apache_agent "$pkgdir"/usr/sbin/
  install -Dm755 asar_apache_gather "$pkgdir"/usr/sbin/
}

