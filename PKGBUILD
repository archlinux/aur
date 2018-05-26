# Maintainer: Zookah <zookah77 at gmail dot com>
# Maintainer: Ydallilar <yigit dot dallilar at gmail dot com>
# Contributor: Qinq-net

pkgname=osp-tracker
pkgver=5.0.5
arch=('x86_64')
pkgrel=1
pkgdesc='Tracker video analysis and modeling tool'
url='http://physlets.org/tracker/'
license=('GPL3')
depends=('gtk2'
         'gconf'
         'java-runtime')
_runname="Tracker-${pkgver}-linux-64bit-installer.run"
source=("${url}/installers/${_runname}"
        "tracker.sh"
        "tracker.desktop")
md5sums=('f0010a0c793a5885d28f001b1bee0e14'
         '4f457c6b8231a48eb3cd302c7629fd9d'
         '805138863c7eb51258022e4d66edab92')

package() {

  echo "${pkgdir}"
  export XDG_UTILS_INSTALL_MODE=user
  msg2 'Starting Tracker installer'
  chmod +x "./${_runname}"
  ./${_runname} \
	  --mode unattended \
	  --tracker-home "${pkgdir}/opt/tracker" \
	  --experiments-home "${pkgdir}/opt/tracker/share" \
	  --enable-components Experiments \
	  --unattendedmodeui none || true #ignore errors due to attempts to copy files to /usr/share/applications

  msg2 'Creating desktop file and symlinks'
  install -D -m755 "tracker.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m755 "tracker.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/tracker/tracker_icon48.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}
