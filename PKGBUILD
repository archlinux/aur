# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=5.0.2
pkgrel=2
pkgdesc="a cross-platform audiobook manager designed for Audible users. Manage all your audiobooks with this easy-to-use desktop application"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
depends=("desktop-file-utils" "webkit2gtk-4.1")
source=("https://github.com/openaudible/openaudible/releases/download/v5.0.2/OpenAudible_5.0.2_x86_64.deb")
sha512sums=('0f7d9435f48943d4abe14aa0994d53d1b6e7ad749c6f3a3cb7f6f02583e2d4bd1a5c992a10e293e3ee0cd14cd0ca531379744d9a170db9cb6ad4b6392c13b7fc')

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
