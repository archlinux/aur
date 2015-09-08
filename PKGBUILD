# Maintainer: Richard Graham <richard@rdg.cc>
pkgname=labview-2010
pkgver=10
pkgrel=1
pkgdesc="A system-design platform and development environment for a visual programming language from National Instruments."
url="http://www.ni.com/labview/release-archive/2010/"
arch=('i686' 'x86_64')
license=('custom:LabVIEW-2010')
install='labview-2010.install'
PKGEXT='.pkg.tar'

depends=('xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
if test "$CARCH" == x86_64; then
  depends+=(
  'lib32-glibc'
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-libdrm' 
  'lib32-libx11' 
  'lib32-libxau' 
  'lib32-libxcb' 
  'lib32-libxcursor' 
  'lib32-libxdamage' 
  'lib32-libxdmcp' 
  'lib32-libxext' 
  'lib32-libxfixes' 
  'lib32-libxinerama' 
  'lib32-libxrender' 
  'lib32-libxxf86vm' 
  'lib32-mesa'
  'lib32-openssl-compatibility'
  'lib32-libxt'
  )
fi

makedepends=('rpmextract' 'sed')
options=('!strip')
source=(
    'labview-2010-appbuild-10.0.0-1.i386.rpm'
    'labview-2010-core-10.0.0-1.i386.rpm'
    'labview-2010-desktop-10.0.0-1.i386.rpm'
    'labview-2010-examples-10.0.0-1.i386.rpm'
    'labview-2010-help-10.0.0-1.i386.rpm'
    'labview-2010-pro-10.0.0-1.i386.rpm'
    'labview-2010-ref-10.0.0-1.i386.rpm'
    'labview-2010-rte-10.0.0-1.i386.rpm'
    'niexfinder-base-1.0-19.i386.rpm'
    'niexfinder-labview-2010-10.0.0-1.i386.rpm'
    'nilvcompare-10.0.0-1.i386.rpm'
    'nilvmerge-10.0.0-1.i386.rpm'
    'nisvcloc-10.0.0-1.i386.rpm'
    'niwebpipeline20_dep-2.0-5.i586.rpm'
    'LICENSE.txt'
    'PATENTS.txt'
)

md5sums=(
    '003fa58d0e43d74441f1716f8a83fc59'
    'a6f209b7901f24c0ab67e823f6aa83f7'
    'eebffdb3ebe3d2b9f0b4c2c89e0e0e3d'
    'e0f1d1e471ce2968179b1ef9e5f35252'
    '4473f311612201711144a12313bc6837'
    '5646bfdb013790d394969b80a9e621ac'
    '630e8fc2155d752118e436b37f19ceb9'
    '0566b80b88d805a3a56eed08c4281d78'
    '1f237f1937db222ca717034cbd82fb55'
    'e019e0476940e077cdd97658ac525f22'
    '6c1c92c1b61d27e94177f568f7614da6'
    'd31a78a16e9de038d48d4c5a13ce0376'
    'c9e58c450ea14c146c5e290f357c9886'
    '432bc600994a9c29be67144de730490e'
    'b2bdb88ba72887a28351dbf37318f655'
    'a1a1c2c25ae24f9c0e54c1003d772a79'
)

package() {
    
     rpmextract.sh ../labview-2010-appbuild-10.0.0-1.i386.rpm
	 rpmextract.sh ../labview-2010-core-10.0.0-1.i386.rpm
	 rpmextract.sh ../labview-2010-desktop-10.0.0-1.i386.rpm
	 rpmextract.sh ../labview-2010-examples-10.0.0-1.i386.rpm
	 rpmextract.sh ../labview-2010-help-10.0.0-1.i386.rpm
	 rpmextract.sh ../labview-2010-pro-10.0.0-1.i386.rpm
	 rpmextract.sh ../labview-2010-ref-10.0.0-1.i386.rpm
	 rpmextract.sh ../labview-2010-rte-10.0.0-1.i386.rpm
	 rpmextract.sh ../niexfinder-base-1.0-19.i386.rpm
	 rpmextract.sh ../niexfinder-labview-2010-10.0.0-1.i386.rpm
	 rpmextract.sh ../nilvcompare-10.0.0-1.i386.rpm
	 rpmextract.sh ../nilvmerge-10.0.0-1.i386.rpm
	 rpmextract.sh ../nisvcloc-10.0.0-1.i386.rpm
	 rpmextract.sh ../niwebpipeline20_dep-2.0-5.i586.rpm
     
     mkdir -p ${pkgdir}/usr/lib
     mkdir -p ${pkgdir}/opt
     
     mv ${srcdir}/usr/local/lib/* ${pkgdir}/usr/lib
     mv ${srcdir}/usr/local/* ${pkgdir}/opt
     
     mkdir -p ${pkgdir}/usr/share/licenses/LabVIEW-2010
     cp ../LICENSE.txt ${pkgdir}/usr/share/licenses/LabVIEW-2010/LICENSE.txt
     cp ../PATENTS.txt ${pkgdir}/usr/share/licenses/LabVIEW-2010/PATENTS.txt
     
     # sed  `cat /etc/natinst/labview-2010/labview.dir`    /opt/nationst/LabVIEW-2010
     #ln -s ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/apps/natinst-labview-2010.desktop ${pkgdir}/usr/share/applications/natinst-labview-2010.desktop
     
     mkdir -p ${pkgdir}/usr/share/icons/hicolor/48x48/apps
     mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps
     mkdir -p ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes
     mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes
     
     cp ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/icons/48x48/labview.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/labview.png
     cp ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/icons/48x48/natinst-labview.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/natinst-labview.png
     cp ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/icons/128x128/labview.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/labview.png
     cp ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/icons/128x128/natinst-labview.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/natinst-labview.png
     
     for file in ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/icons/48x48/i-*.png; do
        cp $file ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/`echo ${file##*/} | sed "s,i-,application-x-,"`
        cp $file ${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/`echo ${file##*/} | sed "s,i-,application-x-,"`
     done
     
     mkdir -p ${pkgdir}/usr/share/applications
     sed "s,Exec.*,Exec=/opt/natinst/LabVIEW-2010/labview -launch "%F"," ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/apps/natinst-labview-2010.desktop > ${pkgdir}/usr/share/applications/natinst-labview-2010.desktop
     
     mkdir -p ${pkgdir}/usr/share/mime/packages
     cp ${pkgdir}/opt/natinst/LabVIEW-2010/etc/desktop/mime/labview.xml ${pkgdir}/usr/share/mime/packages
}
