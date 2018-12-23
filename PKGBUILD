# Maintainer: basigur

pkgname=mcos-mjv-xfce-edition
_pkgname=McOS-MJV-XFCE-Edition
pkgver=2.3r5.6435c39
_pkgver=2.3
pkgrel=1
pkgdesc="It's GTK2,GTK3,XFCE4,NOTIFYD theme Mac OS created PaulXFCE"
arch=('any')
url="https://github.com/paullinuxthemer/McOS-MJV-XFCE-Edition"
license=('GPL2')
depends=('gtk-engine-murrine')
replaces=(mcos-mjv-xfce-edition)
conflicts=(mcos-mjv-gtk-theme)
makedepends=('git')

source=("${_pkgname}::git+https://github.com/paullinuxthemer/${_pkgname}")

sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  echo "2.3r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package(){

	cd "${srcdir}/${_pkgname}"
	mv McOS-MJV-Dark-XFCE-Edition-"${_pkgver}" McOS-MJV-Dark-Xfce
	mv "${_pkgname}"-"${_pkgver}" McOS-MJV-Xfce
	install -d "${pkgdir}/usr/share/themes"
	cp -r 'McOS-MJV-Dark-Xfce' "${pkgdir}"/usr/share/themes/
	cp -r 'McOS-MJV-Xfce' "${pkgdir}"/usr/share/themes/
	install -D -m644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE
	install -D -m644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/'README.md'

	sed -i 's!  background-color: #2c2b2c;!  background-color: #3f4042;!' "$pkgdir"/usr/share/themes/McOS-MJV-Dark-Xfce/gtk-3.0/gtk.css

	rm -r "${pkgdir}"/usr/share/themes/{McOS-MJV-Dark-Xfce,McOS-MJV-Xfce}/{'READ ME','COPYING'}

}
