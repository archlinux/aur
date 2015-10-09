# Maintainer: Chris <alostengineer at narmos dot org>
pkgname=madsonic
pkgver=5.1.5250
pkgvera=5.1
pkgdate=20150813
pkgrel=2
pkgdesc="Madsonic Mashup Mod is a fork of the Subsonic 4.8 Server Build 3436 with some Subsonic Data schema modifications!"
arch=('i686' 'x86_64')
url="http://madsonic.org/"
license=('GPL')
depends=('jre7-openjdk-headless' 'fontconfig' 'libcups')
optdepends=('ffmpeg: Audio Transcoding')
conflicts=('subsonic-beta' 'subsonic' 'subsonic-git' 'madsonic-beta')
source=(http://madsonic.org/download/${pkgvera}/${pkgdate}_${pkgname}-${pkgver}-standalone.tar.gz
'madsonic.service' 
'enable_config.patch' 
'madsonic.conf')
backup=('var/madsonic/db' 'var/madsonic/madsonic.sh' 'etc/madsonic.conf')
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


md5sums=('6fec9f9804b26d5105c6da83ae86df4f'
	 '67f335ebe2755d8af0ffa209c7e5b9c4'
	 '14518e65fbd97825e24f5801a5f723ad'
	 'c590d9cb9e21a99b9cb29e224365c938'  )
