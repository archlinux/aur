# Maintainer: Hu3rror <hu3rror@protonmail.com>

pkgname=animationgarden-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Desktop application for Animation Garden."
arch=('x86_64')
url="https://github.com/Him188/animation-garden"
license=('GPL')
depends=('expat' 'util-linux-libs' 'xdg-utils' 'zlib')
source=("https://github.com/Him188/animation-garden/releases/download/v$pkgver/AnimationGarden-$pkgver-debian-amd64.deb")
sha512sums=('1ffcb2bde3ce49180956a71c31c47fe088415833ea49d55a389db5c4b1cd31838196c38a2b34ddbfa007bb0fe79fd9f7d6fab0f4528a31c0d062fcf65f2f4509')
provides=(animationgarden-bin)
conflicts=(animationgarden-bin-dev)

package() {
	cd "${srcdir}"
	# Extract package dataj
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	install -dm755 "${pkgdir}"/usr/bin
	ln -s /opt/animationgarden/bin/AnimationGarden "${pkgdir}"/usr/bin/AnimationGarden
	install -Dm644 "${pkgdir}"/opt/animationgarden/share/doc/copyright "${pkgdir}"/usr/share/licenses/$pkgname/COPYRIGHT
	sed -i 's|^Exec=/opt/animationgarden/bin/AnimationGarden|Exec=AnimationGarden|g' "${pkgdir}"/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop
	sed -i 's|^Icon=/opt/animationgarden/lib/AnimationGarden|Icon=/usr/share/icons/AnimationGarden|g' "${pkgdir}"/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop
	install -Dm644 "${pkgdir}/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop" "${pkgdir}/usr/share/applications/animationgarden-AnimationGarden.desktop"
	install -Dm644 "${pkgdir}/opt/animationgarden/lib/AnimationGarden.png" "${pkgdir}/usr/share/icons/AnimationGarden.png"
}
