# Maintainer: Chris <alostengineer at narmos dot org>
pkgname=madsonic-beta
pkgver=5.1.5260
pkgvera=5.1
pkgdate=20150831
pkgrel=2
pkgdesc="Madsonic Mashup Mod is a fork of the Subsonic 4.8 Server Build 3436 with some Subsonic Data schema modifications! This is the latest Beta 5.1 Build."
arch=('i686' 'x86_64')
url="http://madsonic.org/"
license=('GPL')
depends=('jre7-openjdk-headless' 'fontconfig' 'libcups')
optdepends=('ffmpeg: audio transcoding')
conflicts=('subsonic-beta' 'subsonic' 'subsonic-git' 'madsonic')
provides=('madsonic')
source=(http://madsonic.org/download/${pkgvera}/${pkgdate}_madsonic-${pkgver}-standalone.tar.gz
'madsonic.service' 
'enable_config.patch' 
'madsonic.conf')
changelog=CHANGELOG
backup=('var/madsonic/db' 'var/madsonic/madsonic.sh')
install=madsonic.install
 
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
  patch $pkgdir/var/madsonic/madsonic.sh $srcdir/enable_config.patch
}


md5sums=('30b90f30469b9b46e5a34e13a42a1fe5'
	 '67f335ebe2755d8af0ffa209c7e5b9c4'
	 '14518e65fbd97825e24f5801a5f723ad'
	 'c590d9cb9e21a99b9cb29e224365c938'  )
