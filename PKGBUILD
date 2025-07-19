# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="famsa"
_repo="refresh-bio/FAMSA"
pkgname="${_pkgname}-bin"
pkgver=2.4.1
pkgrel=1
pkgdesc="Algorithm for ultra-scale multiple sequence alignments"
arch=('x86_64')
url="https://github.com/$_repo"
license=('GPL-3.0-only')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('3314aad967c9d2d2e9ee5e8ace06a11c5667e2bba18a02412541a8b3dc71db5c')
source=("LICENSE-${sha256sums}::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE")
source_x86_64=("famsa-${sha256sums_x86_64}.tar.gz::${url}/releases/download/v$pkgver/famsa-v$pkgver-x64_linux.tar.gz")
pkgver() {
	curl --silent -L "https://api.github.com/repos/${_repo}/releases/latest" | # Get latest release from GitHub api
		grep '"tag_name":' |                                                      # Get tag line
		sed -E 's/.*"([^"]+)".*/\1/' |
		sed 's/v//'
}

package() {
	install -Dm 644 "${srcdir}/LICENSE-${sha256sums}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 755 "${srcdir}/famsa" "${pkgdir}/usr/bin/famsa"
}
