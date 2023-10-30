# Contributer: Rodney van den Velden <rodney@dfagaming.nl>
# Maintainer: Mateusz Krawczynski <matikrawczpl@gmail.com>

pkgname=gosumemory
pkgver=1.3.8
pkgrel=1
pkgdesc="Cross-Platform memory reader for osu!"
arch=(x86_64)
url="https://github.com/l3lackShark/gosumemory"
license=("GPL")
depends=("lib32-glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=(gosumemory)
conflicts=(gosumemory)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/l3lackShark/${pkgname}/releases/download/${pkgver}/${pkgname}_linux_386.zip"
        )
noextract=("${pkgver}/${pkgname}_linux_386.zip")
sha256sums=("1e52c647b1547a7b79c4843ce52b3ef9b304c17ed16a15076170443a003152d3")
validpgpkeys=()

prepare() {
	unzip -f "${pkgname}_linux_386.zip"
}

package() {
	# Install gosumemory binary
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/opt/gosumemory/gosumemory"
	
	# Copy all files in "static" (these are the overlays)
	cp -r "${srcdir}/static" "${pkgdir}/opt/gosumemory"
	
	# Remove unnecessary files
	rm -rf "${pkgdir}/opt/gosumemory/static/.git"
	rm -f "${pkgdir}/opt/gosumemory/static/LICENSE"
	
	# Install the LICENSE
	install -Dm644 "${srcdir}/static/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
