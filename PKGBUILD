# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=4.7.4
pkgrel=1
pkgdesc="a cross-platform audiobook manager designed for Audible users. Manage all your audiobooks with this easy-to-use desktop application"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
depends=("desktop-file-utils" "webkit2gtk")
source=("https://github.com/openaudible/openaudible/releases/download/v4.7.4/OpenAudible_4.7.4_x86_64.deb")
sha512sums=('a56d10c491749d049cb8cc0651630b4b458bad51bdc02dc5a694817f88876a3616ff59eaa64c7adaf40ee385bdef79c3d59dfc636552d970e5d82d9732614cbd')

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
