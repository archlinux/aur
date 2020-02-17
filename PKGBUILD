# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_projname='NExtGen'
_appname="${_projname,,}"
pkgname="${_appname}-git"
pkgver='r3.f8731ce'
pkgrel=1
pkgdesc="A small bash script that lets you easily set up a new extension project for GNOME's Nautilus file manager"
arch=('any')
url="https://github.com/madmurphy/${_projname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
provides=("${_appname}")
conflicts=("${_appname}")
source=("git+https://github.com/madmurphy/${_projname}.git")
sha256sums=('SKIP')

pkgver() {

	cd "${_projname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

	cd "${srcdir}/${_projname}"

	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${_appname}"
	install -dm755 "${pkgdir}/usr/share/doc/${_appname}"

	cp -a "${srcdir}/${_projname}"/* "${pkgdir}/usr/share/${_appname}"
	mv "${pkgdir}/usr/share/${_appname}"/{COPYING,README.md,ChangeLog.md} "${pkgdir}/usr/share/doc/${_appname}/"
	rm -f "${pkgdir}/usr/share/${_appname}/package.json"
	ln -s "/usr/share/${_appname}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

}

