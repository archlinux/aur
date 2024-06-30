# Maintainer: Loic Bidoux <loic.bidoux [at] owndata.org>

pkgname=servicemix
pkgver=7.0.1
pkgrel=1
pkgdesc='Apache ESB that unifies features and functionality of ActiveMQ, Camel, CXF, ODE and Karaf.'
arch=(any)
url=http://servicemix.apache.org
license=('Apache')
depends=('bash' 'java-runtime')
install='.install'
changelog='.Changelog'
source=("https://dlcdn.apache.org/servicemix/servicemix-7/$pkgver/apache-servicemix-$pkgver.zip" 'servicemix')
sha256sums=('fc0708ee17b5acef4a3e72c876a08f64eef9ac5d1274ff3ef32c6aed2cc5c747'
            'cf95697567ac4364178ecae1fbd1f4e488c9f7d8e27eca2e1e19dad3a8231ca1')
package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/{java/servicemix/{lib,system},licenses/servicemix,servicemix/{bin,examples}}
  install -d $pkgdir/var/lib/servicemix/{data,deploy,instances}
  install -d $pkgdir/etc/servicemix

  cp $srcdir/servicemix $pkgdir/usr/bin/servicemix
  cp -r $srcdir/apache-servicemix-$pkgver/{bin,examples,NOTICE,README} $pkgdir/usr/share/servicemix
  cp -r $srcdir/apache-servicemix-$pkgver/{data,deploy} $pkgdir/var/lib/servicemix
  cp -r $srcdir/apache-servicemix-$pkgver/etc/* $pkgdir/etc/servicemix
  cp -r $srcdir/apache-servicemix-$pkgver/{lib,system} $pkgdir/usr/share/java/servicemix
  cp -r $srcdir/apache-servicemix-$pkgver/{licenses/*,LICENSE} $pkgdir/usr/share/licenses/servicemix

  chmod go+x $pkgdir/usr/bin/servicemix
  chmod -R g+w $pkgdir/var/lib/servicemix
  chmod -R g+w $pkgdir/etc/servicemix
  
  ln -s /var/lib/servicemix/data $pkgdir/usr/share/servicemix/data
  ln -s /var/lib/servicemix/deploy $pkgdir/usr/share/servicemix/deploy
  ln -s /etc/servicemix $pkgdir/usr/share/servicemix/etc
  ln -s /var/lib/servicemix/instances $pkgdir/usr/share/servicemix/instances
  ln -s /usr/share/java/servicemix/lib $pkgdir/usr/share/servicemix/lib
  ln -s /usr/share/licenses/servicemix/LICENSE $pkgdir/usr/share/servicemix/LICENSE
  ln -s /usr/share/licenses/servicemix $pkgdir/usr/share/servicemix/licenses
  ln -s /var/lib/servicemix/lock $pkgdir/usr/share/servicemix/lock
  ln -s /usr/share/java/servicemix/system $pkgdir/usr/share/servicemix/system
}
