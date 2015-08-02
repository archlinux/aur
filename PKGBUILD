#Maintainer:  MartiMcFly martimcfly@autorisation.de
#Maintainer:  Yahya Mohajer <yaya_2013 {AT} yahoo {DOT} com >

pkgname=nexus
pkgver=2.11.4
patchver=01
pkgrel=2
pkgdesc="A Maven Repository Manager. Nexus 2"
url="http://nexus.sonatype.org"
arch=('i686' 
      'x86_64')
license=('GPL3')
depends=('java-environment')
optdepends=('apache: a full featured webserver'
            'maven: a java project management and project comprehension tool')

install=nexus.install
backup=(opt/nexus/bin/jsw/conf/wrapper.conf)
conflicts=('nexus2')
provides=('java-nexus' 
	  'nexus')
options=(!strip !docs)

source=("http://www.sonatype.org/downloads/nexus-${pkgver}-${patchver}-bundle.tar.gz"
        'http://wrapper.tanukisoftware.com/download/3.5.26/wrapper-delta-pack-3.5.26.tar.gz'
        'nexus'
        'nexus.service')	

md5sums=('e274d6622560d41002b0f12d24c9c383'
         '8c1e180aba2b3991bcf107e899a96cbd'
         'fee6289e0ee48ee5705da54660f7595d'
         'ac7c0c60bb3c77ff67965ec160ef2517')

package() {
  cd ${srcdir}

  # Create directories
  install -d $pkgdir/opt/nexus
 

  # move documentation to the right location
  mkdir -p $pkgdir/usr/share/doc/nexus
  install $srcdir/nexus-$pkgver-$patchver/*.txt $pkgdir/usr/share/doc/nexus
  rm $srcdir/nexus-$pkgver-$patchver/*.txt

  # move example configuration to the right location
  mkdir -p $pkgdir/usr/share/doc/nexus/conf

  mkdir -p $pkgdir/opt/sonatype-work
  mkdir -p $pkgdir/opt/nexus/run

  # copy the source to the final directory
  cp -a $srcdir/nexus-${pkgver}-${patchver}/* $pkgdir/opt/nexus || return 1
  install $srcdir/nexus $pkgdir/opt/nexus/bin/nexus

    #install $srcdir/nexus.properties $pkgdir/opt/nexus/conf/nexus.properties || return 1

  install -Dm644 "${srcdir}/nexus.service" "${pkgdir}/usr/lib/systemd/system/nexus.service"

}
