# Maintainer: alostengineer
# Submitter: alostengineer
pkgname=madsonic
pkgver=5.1.5240
pkgvera=5.1
pkgdate=20150506
pkgrel=1
pkgdesc="Madsonic Mashup Mod is a fork of the Subsonic 4.8 Server Build 3436 with some Subsonic Data schema modifications!"
arch=('i686' 'x86_64')
url="http://madsonic.org/"
license=('GPL')
depends=('jre7-openjdk-headless' 'fontconfig' 'libcups')
conflicts=('subsonic-beta' 'subsonic' 'subsonic-git')
source=(http://madsonic.org/download/${pkgvera}/${pkgdate}_${pkgname}-${pkgver}-standalone.tar.gz
'madsonic.service' 
'arch_env_vars.patch' 
'madsonic.conf')
backup=('var/webapps/madsonic/db' 'var/webapps/madsonic/madsonic.sh')
install=$pkgname.install
 
package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/webapps/madsonic
  install -m 755 -t $pkgdir/var/webapps/madsonic $srcdir/{madsonic.sh,madsonic.war,madsonic-booter.jar,version.txt}
  install -m 644 -t $pkgdir/var/webapps/madsonic $srcdir/{LICENSE.TXT,README.TXT}
  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m 644 -t $pkgdir/usr/lib/systemd/system $srcdir/madsonic.service
  mkdir -p $pkgdir/etc/webapps/madsonic
  install -m 644 -t $pkgdir/etc/webapps $srcdir/madsonic.conf

# Compatibility with both java runtime available in repos and AUR; locale fixes
  patch $pkgdir/var/webapps/madsonic/${pkgname}.sh $srcdir/arch_env_vars.patch
}


md5sums=('6d7b248351363fe6248ef1e221d005e5'
	 'ea074e3f7d394e1e2caad3b68949675e'
	 '879e256c431785fe573abdd0009b5959'
	 'd3405a285a8b596a147959f64ab76334'  )
