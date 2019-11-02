# Maintainer: Christophe LAVIE <christophe.lavie@laposte.net>

pkgbase='dynamic-wallpaper-catalina'
pkgname=("${pkgbase}-gnome-timed-git" "${pkgbase}-kde-git" "${pkgbase}-images-git" )
_gitname='gnome-kde-dynamic-wallpaper-catalina'
pkgver=1.2.r2.g39f139d
pkgrel=1
arch=('any')
url="https://github.com/japamax/${_gitname}"
source=("git+https://github.com/japamax/${_gitname}")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

 package_dynamic-wallpaper-catalina-images-git() {
	pkgdesc="macOS Catalina dynamic wallpaper based 8 images"
	cd "${srcdir}/${_gitname}"
	install -dm755 "${pkgdir}/usr/share/dynamicwallpapers/catalina-solar/contents/images"
	install -m644 ${srcdir}/${_gitname}/catalina/* "${pkgdir}/usr/share/dynamicwallpapers/catalina-solar/contents/images"
}

 package_dynamic-wallpaper-catalina-gnome-timed-git() {
	depends=(gnome-shell gnome-backgrounds dynamic-wallpaper-catalina-images-git)
	pkgdesc="Time based GNOME macOS Catalina wallpaper with real scheludes"
	install=dynamic-wallpaper-catalina-gnome-timed-git.install
	cd "${srcdir}/${_gitname}"
	install -dm755 "${pkgdir}/usr/share/backgrounds/macOS"
	ln -s "/usr/share/dynamicwallpapers/catalina-solar/contents/images" "${pkgdir}/usr/share/backgrounds/macOS/catalina"
	install -Dm644 catalina-timed.xml "${pkgdir}/usr/share/backgrounds/macOS/catalina-timed.xml"
	install -Dm644 catalina.xml "${pkgdir}/usr/share/gnome-background-properties/catalina.xml"
 }
 
 package_dynamic-wallpaper-catalina-kde-git() {
	depends=('plasma5-wallpapers-dynamic>=2.3' dynamic-wallpaper-catalina-images-git)
	pkgdesc="Azimuth Elevation based / Time based KDE macOS Catalina wallpaper"
	install=dynamic-wallpaper-catalina-kde-git.install
	cd "${srcdir}/${_gitname}"
	install -dm755 "${pkgdir}/usr/share/dynamicwallpapers/catalina-timed/contents"
	ln -s "/usr/share/dynamicwallpapers/catalina-solar/contents/images" "${pkgdir}/usr/share/dynamicwallpapers/catalina-timed/contents/images"
	install -Dm644 catalina-solar.json "${pkgdir}/usr/share/dynamicwallpapers/catalina-solar/metadata.json"
	install -Dm644 catalina-timed.json "${pkgdir}/usr/share/dynamicwallpapers/catalina-timed/metadata.json"
 }
