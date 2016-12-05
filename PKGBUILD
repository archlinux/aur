# Maintainer: Allen Zhong <moeallenz@gmail.com>
pkgname=asar-apache
pkgver=r54
pkgrel=2
pkgdesc="A System Activity Reporter of apache httpd"
arch=(i686 x86_64)
url="http://code.google.com/p/python-asar/"
license=('GPL2')
depends=('apache')
source=("https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/python-asar/source-archive.zip")
md5sums=('857d51f08ea5c3b3f70d946b76ec3747')

build() {
  cd "$srcdir"/python-asar/trunk/asar-apache-agent/

  sed -i 's/\/tmp/\/var\/log\/httpd/g' *.c
  gcc -o asar_apache_agent asar_apache_agent.c
  gcc -o asar_apache_gather asar_apache_gather.c
}

package() {
  cd "$srcdir"/python-asar/trunk/asar-apache-agent/
  install -d "$pkgdir"/usr/sbin
  install -Dm755 asar_apache_agent "$pkgdir"/usr/sbin/
  install -Dm755 asar_apache_gather "$pkgdir"/usr/sbin/
}

