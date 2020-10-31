# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0
_pkgver_ext=20201010f
_pkg_file_name=${_pkgname}${_pkgver_ext}.deb
pkgrel=2
pkgdesc="Remote control and team work"
arch=('x86_64')
url="https://www.todesk.cn/"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("local://${_pkg_file_name}")
sha256sums=('367b9ea53fd79283612e95a899b2f18488aa14e14b0beee4c26132475df75ee3')

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		echo ""
		echo "The package can be downloaded here: "
		echo "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		echo ""
	fi
fi

package() {
  bsdtar -o --no-same-permissions -xf ${srcdir}/data.tar.xz -C ${pkgdir} 
  install -Dm755 ${pkgdir}/usr/local/bin/${_pkgname} -t ${pkgdir}/usr/bin/
  rm -rf ${pkgdir}/usr/local

  # fixed permission
  install -dm755 ${pkgdir}/opt/todesk/lib

  # desktop entry 
  sed -i "s|Emulator||g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # deleted unneed ico
  rm -rf ${pkgdir}/usr/share/pixmaps/128.png
}

# vim: set sw=2 ts=2 et:
