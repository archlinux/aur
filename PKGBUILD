# Maintainer:  Oliver Kahrmann <oliver.kahrmann at gmail dot com>

pkgname=bionic-batch-renamer
pkgver=1.0.11+1.298ce42
pkgrel=1
_commit=298ce42187c1e9c5f4c44ba2bcec778b4316ed24
pkgdesc="A powerful batch file renaming utility built with the Qt technology stack."
arch=('any')
url="https://github.com/Nomen-Luni/Bionic-Batch-Renamer"
license=('GPL3')
makedepends=('git')
depends=('qt5-base' 'libkexiv2-qt5')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}::git+https://github.com/Nomen-Luni/Bionic-Batch-Renamer.git#commit=$_commit")
sha256sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	qmake Code/Batch_Renamer.pro
	make
}

package() {
	cd "$srcdir/${pkgname}"
	base_dir_deb_packaging="Deb Packaging/bionic-batch-renamer_1.0.11_amd64"

	install -Dm755 "Batch_Renamer" "${pkgdir}/usr/bin/Batch_Renamer"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "$base_dir_deb_packaging/usr/share/applications/Bionic_Batch_Renamer.desktop" "${pkgdir}/usr/share/applications/Bionic_Batch_Renamer.desktop"

	# Plasma 5:
	install -Dm644 "$base_dir_deb_packaging/usr/share/kservices5/ServiceMenus/Bionic_Batch_Renamer.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/Bionic_Batch_Renamer.desktop"
	# Plasma 6:
	install -Dm644 "$base_dir_deb_packaging/usr/share/kservices5/ServiceMenus/Bionic_Batch_Renamer.desktop" "${pkgdir}/usr/share/kio/servicemenus/Bionic_Batch_Renamer.desktop"

}
