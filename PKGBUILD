# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=4.5
pkgrel=2
pkgdesc="a cross-platform audiobook manager designed for Audible users. Manage all your audiobooks with this easy-to-use desktop application"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
depends=("desktop-file-utils" "webkit2gtk")
source=("https://github.com/openaudible/openaudible/releases/download/v"$pkgver"/OpenAudible_"$pkgver"_x86_64.deb")
sha512sums=('a6bcc36116cda10848b59e77418cc977a73d020daa2e8dad49a508966892872ed7c5bd11319f621b55150b1af2a48c1d7035bb2624abb6df671ce3e66042d7bc')

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
