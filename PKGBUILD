# Maintainer : Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=opensong
pkgver=3.4.8
pkgrel=1
pkgdesc="Free software application for managing chords/lyrics and presenting lyrics. Great for worship leaders and musicians." 
arch=('i686' 'x86_64') 
url="http://www.opensong.org/" 
license=('custom')
depends=(gtk2)
source=("https://jaist.dl.sourceforge.net/project/opensong/OpenSong/V${pkgver}%20Beta/${pkgname}_${pkgver}-1_amd64.deb") 
md5sums=('3d3542362ea79c863389b8e1cc567950')

package()
{
  cd ${srcdir}
  ar x ${pkgname}_${pkgver}-1_amd64.deb
  tar -xf data.tar.xz
 
  install -dv -m755 ${pkgdir}/opt
  cp -a ${srcdir}/opt/OpenSong ${pkgdir}/opt/
  #/opt/OpenSong seems to need editing by the user running OpenSong so can't be owned by root...
  #chown -hRv root:root ${pkgdir}/opt/OpenSong
#  install -Dvm644 ${srcdir}/opt/OpenSong/* ${pkgdir}/opt/OpenSong

  # Install the desktop file for DE-users
  install -Dv ${srcdir}/usr/share/applications/opensong.desktop ${pkgdir}/usr/share/applications/opensong.desktop
  # Remove the hard-coded link to the binary for those who want to provide alternative launching
  sed -i 's|\/opt\/OpenSong\/opensong$|opensong|' ${pkgdir}/usr/share/applications/opensong.desktop
  install -dv -m755 ${pkgdir}/usr/bin
  ln -s /opt/OpenSong/opensong ${pkgdir}/usr/bin/opensong
  
}
