# Maintainer: Christophe LAVIE <christophe.lavie@laposte.net>

pkgbase='dynamic-wallpaper-mojave'
pkgname=("${pkgbase}-gnome-timed-git" "${pkgbase}-kde-git" "${pkgbase}-images-git" )
_gitname='gnome-kde-dynamic-wallpaper-mojave'
pkgver=6.1
pkgrel=1
arch=('any')
url="https://github.com/japamax/${_gitname}"
source=("git+https://github.com/japamax/${_gitname}")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

 package_dynamic-wallpaper-mojave-images-git() {
	pkgdesc="macOS Mojave dynamic wallpaper based 16 images"
	cd "${srcdir}/${_gitname}"
	install -dm755 "${pkgdir}/usr/share/dynamicwallpapers/mojave/images"
	install -m644 ${srcdir}/${_gitname}/mojave/* "${pkgdir}/usr/share/dynamicwallpapers/mojave/images"
}

 package_dynamic-wallpaper-mojave-gnome-timed-git() {
	depends=(gnome-shell gnome-backgrounds dynamic-wallpaper-mojave-images-git)
	pkgdesc="Time based GNOME macOS Mojave wallpaper with real scheludes"
	install=dynamic-wallpaper-mojave-gnome-timed-git.install
	cd "${srcdir}/${_gitname}"
	install -dm755 "${pkgdir}/usr/share/backgrounds/macOS"
	ln -s "/usr/share/dynamicwallpapers/mojave/images" "${pkgdir}/usr/share/backgrounds/macOS/mojave"
	install -Dm644 mojave-timed.xml "${pkgdir}/usr/share/backgrounds/macOS/mojave-timed.xml"
	install -Dm644 mojave.xml "${pkgdir}/usr/share/gnome-background-properties/mojave.xml"
 }
 
 package_dynamic-wallpaper-mojave-kde-git() {
	depends=(plasma5-wallpapers-dynamic dynamic-wallpaper-mojave-images-git)
	pkgdesc="Azimuth Elevation based KDE macOS Mojave wallpaper"
	install=dynamic-wallpaper-mojave-kde-git.install
	cd "${srcdir}/${_gitname}"
	install -Dm644 mojave.json "${pkgdir}/usr/share/dynamicwallpapers/mojave/metadata.json"
 }

