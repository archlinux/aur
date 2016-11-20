# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=sorr
pkgver=5.1.0
pkgrel=1
pkgdesc="Streets of Rage Remake (fan remake)"
arch=('i686' 'x86_64')
url="http://www.soronline.net/sorr.htm"
license=('GPL')
makedepends=('git')
depends=('zlib' 'zenity' 'lib32-sdl_mixer')
source=("http://www.soronline.net/downloads/sorr_5.0.orig.tar.gz"
	"http://www.soronline.net/downloads/SORRv051_REV030.zip"
	'sorr'
	'sorr.install'
	)
md5sums=('SKIP'
	 '3951863625d44a2222630d47153a19e5'
	 '3d60078ecdd2582e383e477dfdc67ec4'
	 '17c72f90dc7e77ecae2f2b1543a1ad01'
	)

package() {

  # Use mode 775 so group "games" has rwx
  install -dm775 "${pkgdir}/usr/share/games/sorr"
  install -dm775 "${pkgdir}/usr/share/applications"
  install -dm775 "${pkgdir}/usr/share/pixmaps"
  install -dm775 "${pkgdir}/usr/share/doc/sorr"
  install -dm775 "${pkgdir}/usr/bin"

  msg2 "Installing data files"

  cp -r ${srcdir}/data "${pkgdir}"/usr/share/games/sorr/data
  cp -r ${srcdir}/manual "${pkgdir}"/usr/share/games/sorr/manual
  cp -r ${srcdir}/mod "${pkgdir}"/usr/share/games/sorr/mod
  cp -r ${srcdir}/palettes "${pkgdir}"/usr/share/games/sorr/palettes
  cp -r ${srcdir}/bennugd "${pkgdir}"/usr/share/games/sorr/bennugd

  # Use mode 664 so group "games" can rwx data files
  install -m775 "${srcdir}/bgdc" "${pkgdir}/usr/share/games/sorr"
  install -m775 "${srcdir}/bgdi" "${pkgdir}/usr/share/games/sorr"
  install -m775 "${srcdir}/SorMaker.dat" "${pkgdir}/usr/share/games/sorr"
  install -m775 "${srcdir}/SorR.dat" "${pkgdir}/usr/share/games/sorr"

  msg2 "Installing shorcuts and extras"

  install -m644 "${srcdir}/sorr.png" "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/Manual.html" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/sorr.desktop" "${pkgdir}/usr/share/applications/"
  install -m755 "sorr" "${pkgdir}/usr/bin/sorr"

  msg2 "Adjusting /usr/share/games/sorr owner to games"
  chown -R root:games "${pkgdir}/usr/share/games/sorr"

}


