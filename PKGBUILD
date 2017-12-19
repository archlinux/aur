# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='teamviewer-native'
pkgver='13.0.6634'
pkgrel=1
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('x86_64')
url='http://www.teamviewer.com'
license=('custom')
conflicts=('teamviewer' 'teamviewer-beta')
provides=('teamviewer')
depends=('dbus' 'qt5-webkit' 'qt5-x11extras' 'libsystemd' 'libx11' 'libjpeg-turbo' 'libpng')
source=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb")
sha256sums=('92171c89c74764ab0d654093fcc59bb3ffead2d197bd9473bfb5e93f65dc1120')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  rm -r "${pkgdir}"/etc/apt
  install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service \
		"${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
}

# vim: ts=2 sw=2 et:
