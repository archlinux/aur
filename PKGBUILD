# Maintainer: Viech <viech unvanquished net>

# NOTE: For 0.52.0 only, we do not copy old assets from the system because:
#       1. The new script does not allow seeding the download like this yet.
#       2. A full redownload is necessary for this release anyway.

pkgname=unvanquished-data
pkgver=0.52.0
pkgrel=1
pkgdesc='Game assets for Unvanquished.'
arch=('any')
url='https://www.unvanquished.net'
license=('GPL3')
makedepends=('aria2>=1.18.7-2')
source=("https://raw.githubusercontent.com/Unvanquished/Unvanquished/v${pkgver}/download-paks")
md5sums=('6b0bce3c6cefac4c92a922afc9e47a11')

# Disable package compression since assets are already compressed.
PKGEXT='.pkg.tar'

prepare() {
	chmod +x "${srcdir}/download-paks"
}

package() {
	# Create installation directory.
	install -dm755 "${pkgdir}/usr/share/unvanquished/pkg/"

	# Download assets.
	./download-paks "${pkgdir}/usr/share/unvanquished/pkg/" "${srcdir}"
}
