# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: foalsrock <foalsrock at gmail dot-com>

# Set to a non-zero value to install the old theme variants
# which # do not work well with modern (GTK+ > 3.2x) versions.
_install_old_variants=0

pkgname=moslight-themes-git
pkgver=r409.0fcb3d0
pkgrel=1
pkgdesc='Slick GTK 2/3 and GNOME Shell themes resembling the elementary look'
arch=(any)
url=https://github.com/dasnoopy/moslight-themes
license=(GPL2)
depends=(gtk-engine-murrine gtk-engines gnome-themes-standard)
makedepends=(git)
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"
	mkdir -p "${pkgdir}/usr/share/themes"
	local -a variants=( MecOS MecOS-Dark )
	if [[ -n ${_install_old_variants} && ${_install_old_variants} -ne 0 ]] ; then
		variants+=( MosLight MosEmite MosSky MosCloud MosArc MosArc-dark )
	fi
	for i in "${variants[@]}" ; do
		cp -r "${i}" "${pkgdir}/usr/share/themes/${i}"
	done
}
