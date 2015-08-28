# Maintainer: Chris <alostengineer at narmos dot org>
pkgname=madsonic
pkgver=5.1.5240
pkgvera=5.1
pkgdate=20150506
pkgrel=3
pkgdesc="Madsonic Mashup Mod is a fork of the Subsonic 4.8 Server Build 3436 with some Subsonic Data schema modifications!"
arch=('i686' 'x86_64')
url="http://madsonic.org/"
license=('GPL')
depends=('jre7-openjdk-headless' 'fontconfig' 'libcups')
conflicts=('subsonic-beta' 'subsonic' 'subsonic-git' 'madsonic-beta')
source=(http://madsonic.org/download/${pkgvera}/${pkgdate}_${pkgname}-${pkgver}-standalone.tar.gz
'madsonic.service' 
'enable_config.patch' 
'madsonic.conf')
backup=('var/madsonic/db' 'var/madsonic/madsonic.sh')
install=$pkgname.install
changelog=CHANGELOG
 
package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/madsonic
  install -m 755 -t $pkgdir/var/madsonic $srcdir/{madsonic.sh,madsonic.war,madsonic-booter.jar,version.txt}
  install -m 644 -t $pkgdir/var/madsonic $srcdir/{LICENSE.TXT,README.TXT}
  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m 644 -t $pkgdir/usr/lib/systemd/system $srcdir/madsonic.service
  mkdir -p $pkgdir/etc
  install -m 644 -t $pkgdir/etc $srcdir/madsonic.conf

# Compatibility with both java runtime available in repos and AUR; locale fixes
  patch $pkgdir/var/madsonic/${pkgname}.sh $srcdir/enable_config.patch
}


md5sums=('6d7b248351363fe6248ef1e221d005e5'
	 '009262cf1618ff4827142943659d1800'
	 '14518e65fbd97825e24f5801a5f723ad'
	 'c590d9cb9e21a99b9cb29e224365c938'  )
