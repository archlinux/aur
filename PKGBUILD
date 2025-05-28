# Maintainer:  Oliver Kahrmann <oliver.kahrmann at gmail dot com>

pkgname=bionic-batch-renamer-git
pkgver=r44.1adc0f0
pkgrel=1
pkgdesc="A powerful batch file renaming utility built with the Qt technology stack."
arch=('any')
url="https://github.com/Nomen-Luni/Bionic-Batch-Renamer"
license=('GPL3')
makedepends=('git')
depends=('qt6-base' 'libkexiv2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Nomen-Luni/Bionic-Batch-Renamer.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake6 Code/Batch_Renamer.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	base_dir_deb_packaging="Deb Packaging/bionic-batch-renamer_1.0.11_amd64"

	install -Dm755 "Batch_Renamer" "${pkgdir}/usr/bin/Batch_Renamer"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "$base_dir_deb_packaging/usr/share/applications/Bionic_Batch_Renamer.desktop" "${pkgdir}/usr/share/applications/Bionic_Batch_Renamer.desktop"

	# Plasma 5:
	install -Dm644 "$base_dir_deb_packaging/usr/share/kservices5/ServiceMenus/Bionic_Batch_Renamer.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/Bionic_Batch_Renamer.desktop"
	# Plasma 6:
	install -Dm644 "$base_dir_deb_packaging/usr/share/kservices5/ServiceMenus/Bionic_Batch_Renamer.desktop" "${pkgdir}/usr/share/kio/servicemenus/Bionic_Batch_Renamer.desktop"
}
