# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="layan-cursor-theme-git"
pkgver=0.0.0.7a37de2
pkgrel=1
epoch=1
pkgdesc="A x-cursor theme inspired by layan gtk theme and based on capitaine-cursors"
arch=("any")
url="https://github.com/vinceliuice/Layan-cursors"
license=("GPL3")
makedepends=("git")
provides=("layan-cursor-theme")
conflicts=("layan-cursor-theme")
source=("git+${url}.git")
b2sums=("SKIP")

pkgver()
{
	cd "Layan-cursors"
	if [ "$(git tag|wc -l)" == 0 ]; then
		echo "0.0.0.$(git log -1 --format='%h')"
	else
		git describe --tags | sed "s/-/.r/; s/-g/./"
	fi
}

package()
{
	if [ -z "${_cleancursordirname+x}" ]; then
		_cleancursordirname=false
	fi

	install -d "${pkgdir}/usr/share/icons"
	
	cd "Layan-cursors"
	if [ "$_cleancursordirname" = "true" ]; then
		cp -r "dist" "${pkgdir}/usr/share/icons/Layan Unraveled"
		cp -r "dist-border" "${pkgdir}/usr/share/icons/Layan"
		cp -r "dist-white" "${pkgdir}/usr/share/icons/Layan Reborn"
	else
		cp -r "dist" "${pkgdir}/usr/share/icons/Layan-cursors"
		cp -r "dist-border" "${pkgdir}/usr/share/icons/Layan-border-cursors"
		cp -r "dist-white" "${pkgdir}/usr/share/icons/Layan-white-cursors"
	fi
}
