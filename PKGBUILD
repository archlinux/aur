# Maintainer  : Yiannis A Ginis <drxspace[at]gmail[dot]com>

pkgname=yalpam-git
_pkgname=yalpam
pkgver=32.de54a1f
pkgrel=1
pkgdesc="Yet another Arch Linux PAckage Manager"
arch=('i686' 'x86_64')
url="https://github.com/drxspace/${_pkgname}"
license=('GPL2')
provides=('yalpam')
depends=(
	'xterm'
	'yad'
	'yaourt'
	'reflector'
)
makedepends=(
	'gendesk'
)
source=("git+${url}.git")
sha1sums=('SKIP')
options=('strip' '!debug')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	# Place files
	install -dm755 ${pkgdir}/usr/lib/${_pkgname}
	cp "${srcdir}/${_pkgname}/${_pkgname}".sh "${pkgdir}/usr/lib/${_pkgname}/"
	cp "${srcdir}/${_pkgname}/"yup.sh "${pkgdir}/usr/lib/${_pkgname}/"
	cp "${srcdir}/${_pkgname}/"update-sys.sh "${pkgdir}/usr/lib/${_pkgname}/"
	cp "${srcdir}/${_pkgname}/"libfuncs.sh "${pkgdir}/usr/lib/${_pkgname}/"
	cp "${srcdir}/${_pkgname}/"LICENSE "${pkgdir}/usr/lib/${_pkgname}/"

	# Place desktop entry
	desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_pkgname}/${_pkgname}.desktop"

	# Symlink main system binaries
	install -d "${pkgdir}/usr/sbin"
	ln -s "/usr/lib/${_pkgname}/${_pkgname}".sh "${pkgdir}/usr/sbin/${_pkgname}"
	ln -s "/usr/lib/${_pkgname}/"yup.sh "${pkgdir}/usr/sbin/"yup
	ln -s "/usr/lib/${_pkgname}/"update-sys.sh "${pkgdir}/usr/sbin/"update-sys
	ln -s "/usr/lib/${_pkgname}/"libfuncs.sh "${pkgdir}/usr/sbin/"libfuncs

	# Place license file
	install -D -m644 "${pkgdir}/usr/lib/${_pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.GPL"
}
