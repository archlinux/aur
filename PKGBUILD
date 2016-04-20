# Maintainer: archlinux@carstenfeuls.de

pkgname=kde-services
pkgver="2.1"
pkgrel=5
pkgdesc="kde-service multifunction"
arch=('any')
url="https://opendesktop.org/content/show.php/kde-services?content=147065"
license=('GPL')
depends=('kdebase-runtime' 'dmidecode' 'festival' 'poppler' 'ffmpeg' 'transcode' 'ghostscript' 'fuse' 'cdrkit' 'diffutils' 'fuseiso' 'youtube-dl')
source=("http://downloads.sourceforge.net/project/kde-services/Source-Code/$pkgname-$pkgver.tar.bz2" 
	"System-Tools_addtoservicemenu.desktop")
install=${pkgname}.install
sha512sums=('68a2bd7889da69d0af4000be09736b3e2421042a73595eb9be1cc443af8b486321d395e67ffa21c3e66243724d86dfada077c2e3ef6d0099444c0ed382a0ff46'
            '170b89e91dad38340424911f3a1daad69b4a3bc7aa6813ffd74e53c4b34c2555f68c05334b0d2a7fa17d1f0f778369e7cfe3e0590e18e8e0bf006ec1685a59f2')

package() {
  cd $srcdir/$pkgname-$pkgver
  #sed "255s|xdg-mime|##|" -i Makefile
  #sed "260s|update|##|" -i Makefile
  #sed "261s|xdg|##|" -i Makefile
  #sed "262s|xdg|##|" -i Makefile
  #sed "32s|xdg|##|" -i Makefile
  #sed "33s|update|##|" -i Makefile
  #sed "34s|xdg|##|" -i Makefile
  #sed "35s|xdg|##|" -i Makefile
  #sed "264s|update|##|" -i Makefile
  #sed "265s|xdg|##|" -i Makefile
  #sed "266s|xdg|##|" -i Makefile
#cp servicetypes/* $(PREFIXservicetypes5)
  
  sed -e '/mkdir\ -p \$\(PREFIXservicetypes5\)/ s/^#*/#/' -i Makefile
  sed -e '/servicetypes\/\*/ s/^#*/#/' -i Makefile


  sed -e '/xdg-mime/ s/system/user/' -i Makefile
  sed -e '/update-mime-database/ s/^#*/#/' -i Makefile
  sed -e '/xdg-icon-resource/ s/^#*/#/' -i Makefile
  sed -e '/xdg-desktop-menu/ s/^#*/#/' -i Makefile 
	 
  #sed "27s|/usr|${pkgdir}/usr|" -i Makefile
  make "RPM_BUILD_ROOT=${pkgdir}" install
  # remove kernel rebuild entry is for fedora linux
  rm $pkgdir/usr/share/applications/System_Tools*kernel*
  rm $pkgdir/usr/share/applications/*package*
  #sed '13,36d' <$pkgdir/usr/share/kde4/services/ServiceMenus/System-Tools_addtoservicemenu.desktop
  cp $srcdir/System-Tools_addtoservicemenu.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/System-Tools_addtoservicemenu.desktop
}
