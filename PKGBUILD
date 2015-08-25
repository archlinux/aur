# Maintainer: Sebastien Duthil <duthils@free.fr>

# Note: I can't test on x86, feel free to drop me an email/comment with the
# working PKGBUILD for x86

pkgname=blackvoxel
pkgver=1.39
pkgrel=1
pkgdesc="Game of automation and programming in a voxel world"
arch=('x86_64')
url='http://www.blackvoxel.com/'
license=('GPL3')
depends=()
source=("${pkgname}_source_1_39.tar.bz2::${url}/dm_download.php?file=74")
sha256sums=('0bf8e6b9729fee481d8f4e5bcc791f005b3a5ff8152cdc602fe2a6197bf17bca')

build() {
	cd "${srcdir}/${pkgname}_source_1_39"
	make blackvoxeldatadir="/usr/share/${pkgname}/"
}

package() {
	cd "${srcdir}/${pkgname}_source_1_39"
	make install \
		specialinstall=true \
		DESTDIR="${pkgdir}/" \
		bindir="usr/bin/" \
		blackvoxeldatadir="usr/share/${pkgname}/" \
		icondir2="usr/share/icons/" \
		desktopdir="usr/share/applications/"
	
	# __source_dir="${srcdir}/${pkgname}_source_1_39"
	# install -d "${pkgdir}/usr/bin"
	# install -Dm755 "${__source_dir}/blackvoxel" "${pkgdir}/usr/bin"

	# install -d "${pkgdir}/usr/share/${pkgname}"
	# install -Dm644 "${__source_dir}/gui" "${pkgdir}/usr/bin"

	# # cask executable needs to be one directory deeper than cask-cli.el
	# __prefix="${pkgdir}/usr/share/${pkgname}"
	# install -d "${__prefix}"
	# install -Dm644 *.el "${__prefix}/"
	# install -d "${__prefix}/bin"
	# install -Dm755 "bin/cask" "${__prefix}/bin"
	# install -d "${__prefix}/templates"
	# install -Dm644 templates/* "${__prefix}/templates/"
	# touch "${__prefix}/.no-upgrade"  # Stop cask performing self-upgrades.

	# install -d "${pkgdir}/usr/bin"
	# ln -s "/usr/share/cask/bin/cask" "${pkgdir}/usr/bin/"

	# __site_lisp="${pkgdir}/usr/share/emacs/site-lisp/${pkgname}"
	# install -d "${__site_lisp}"
	# ln -s "/usr/share/${pkgname}/"cask{,-bootstrap}.el "${__site_lisp}/"
}
