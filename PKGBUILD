# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=5.2
pkgrel=2
pkgdesc="a cross-platform audiobook manager designed for Audible users. Manage all your audiobooks with this easy-to-use desktop application"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
depends=("desktop-file-utils" "webkit2gtk-4.1")
source=("https://github.com/openaudible/openaudible/releases/download/v5.2/OpenAudible_5.2_x86_64.deb")
sha512sums=('e607a20ddec0b1c9361826bb4569a98bb88f95e68c4858fbe5119cfcf7accad9f85079ac93b017c8340d0cff5411841f983837d0f0d504bacb3eb7b40ac3553e')

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
