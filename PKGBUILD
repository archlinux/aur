# Maintainer : Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=opensong
pkgver=2.1.2
pkgrel=1
pkgdesc="Free software application for managing chords/lyrics and presenting lyrics. Great for worship leaders and musicians." 
arch=('i686' 'x86_64') 
url="http://www.opensong.org/" 
license=('custom')
depends=()
source=("http://downloads.sourceforge.net/project/opensong/OpenSong/V${pkgver}/${pkgname}_${pkgver}-1_i386.deb") 
md5sums=('8928ee4656903bc38ee9cae6d0677fa1')

if [[ $CARCH == i686 ]]; then
  depends+=(gtk2)
else
  depends+=(lib32-gtk2)
fi

package()
{
  cd ${srcdir}
  ar x ${pkgname}_${pkgver}-1_i386.deb
  tar -xf data.tar.gz
 
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
