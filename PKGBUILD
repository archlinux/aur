# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=4.8.7
pkgrel=1
pkgdesc="a cross-platform audiobook manager designed for Audible users. Manage all your audiobooks with this easy-to-use desktop application"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
depends=("desktop-file-utils" "webkit2gtk")
source=("https://github.com/openaudible/openaudible/releases/download/v4.8.7/OpenAudible_4.8.7_x86_64.deb")
sha512sums=('1bc2b784e637b6dae186eec2331ad220a0bf830ae6a16aafc8850f820339aa69780f4d55459aa11429ea7681b83e0749d9c9e5da0465220ca2c41860c5904826')

package(){
    # Extract package data
    tar xzf data.tar.gz -C "${pkgdir}"

    I4J_INSTALL_LOCATION="/opt/OpenAudible"

	# symlink main binary
	install -d "${pkgdir}/usr/bin"
	ln -sf "$I4J_INSTALL_LOCATION/OpenAudible" "${pkgdir}/usr/bin/openaudible"
	ln -sf "$I4J_INSTALL_LOCATION/OpenAudible" "${pkgdir}/usr/bin/OpenAudible"

	# Install icons
	install -Dm644 "${pkgdir}/opt/OpenAudible/share/icons/hicolor/512x512/apps/org.openaudible.OpenAudible.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.openaudible.OpenAudible.png"
	install -Dm644 "${pkgdir}/opt/OpenAudible/share/icons/hicolor/scalable/apps/org.openaudible.OpenAudible.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.openaudible.OpenAudible.svg"

	# Install metainfo files
	install -Dm644 "${pkgdir}/opt/OpenAudible/share/metainfo/org.openaudible.OpenAudible.metainfo.xml" \
			"${pkgdir}/usr/share/metainfo/org.openaudible.OpenAudible.metainfo.xml"

	# desktop entry
	desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${pkgdir}/opt/OpenAudible/share/applications/org.openaudible.OpenAudible.desktop"
}
