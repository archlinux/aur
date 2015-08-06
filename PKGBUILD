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
'madsonic.service')
backup=('var/madsonic/db' 'var/madsonic/madsonic.sh')
install=$pkgname.install
 
package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/madsonic
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp  * $pkgdir/var/madsonic
  rm $pkgdir/var/madsonic/{${pkgname}.bat,${pkgdate}_${pkgname}-${pkgver}-standalone.tar.gz}
  cp $srcdir/madsonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/madsonic/${pkgname}.sh
 
# Compatibility with both java runtime available in repos and AUR
  javahome="JAVA_HOME=/opt/java/jre:/usr/lib/jvm/java-7-openjdk"
  sed -i "20 i $javahome" $pkgdir/var/madsonic/${pkgname}.sh  
 
# Locale Fixes
  lang_a="export LANG="en_US.UTF-8""
  lang_b="export LC_CTYPE="en_US.UTF-8""
  sed -i "21 i $lang_a" $pkgdir/var/madsonic/${pkgname}.sh
  sed -i "22 i $lang_b" $pkgdir/var/madsonic/${pkgname}.sh
}


md5sums=('6d7b248351363fe6248ef1e221d005e5'
	 '838c89461e1e6ac0d20140c7597f8045' )
