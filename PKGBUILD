# Maintainer: Chris <alostengineer at narmos dot org>
pkgname=madsonic6
pkgver=6.0.7600
pkgvera=6.0
pkgdate=20151008
pkgrel=2
pkgdesc="Madsonic Mashup Mod is a fork of the Subsonic Server Build with some Subsonic Data schema modifications! This is the latest devel version.:"
arch=('i686' 'x86_64')
url="http://madsonic.org/"
license=('GPL')
depends=('jre7-openjdk-headless' 'fontconfig' 'libcups')
optdepends=('ffmpeg: Audio Transcoding')
conflicts=('subsonic-beta' 'subsonic' 'subsonic-git' 'madsonic-beta' 'madsonic')


source=(http://madsonic.org/download/${pkgvera}/${pkgdate}_madsonic-${pkgver}-standalone.tar.gz
'madsonic6.service' 
'enable_config_v6.patch' 
'madsonic6.conf')

md5sums=('733675d88f6cc229d1f33687221877fb'
	 '2d9b4da84d5e148a6d09a9e07d7050f2'
	 '7ec18a1247f9215670a5e41ac047dcf1'
	 'fcc60cd39c137f39d27e5be56ea3ef0e'  )

backup=('var/madsonic6/db' 'var/madsonic6/madsonic.sh' 'etc/madsonic6.conf')
install=$pkgname.install
#changelog=CHANGELOG
 
package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/madsonic6
  install -m 755 -t $pkgdir/var/madsonic6 $srcdir/{madsonic.sh,madsonic.war,madsonic-booter.jar,version.txt}
  install -m 644 -t $pkgdir/var/madsonic6 $srcdir/license.txt
  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m 644 -t $pkgdir/usr/lib/systemd/system $srcdir/madsonic6.service
  mkdir -p $pkgdir/etc
  install -m 644 -t $pkgdir/etc $srcdir/madsonic6.conf

# Compatibility with both java runtime available in repos and AUR; locale fixes
  patch $pkgdir/var/madsonic6/madsonic.sh $srcdir/enable_config_v6.patch
}

