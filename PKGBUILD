# Maintainer: Gamma <GammaFunction@vivaldi.net>
pkgname=bwutil-git
pkgver=v0.1
pkgrel=3
license=('MIT')
pkgdesc='A wrapper for bitwarden'
url='https://github.com/xPMo/bwutil'
arch=('any')
provides=('bwutil')
conflicts=('bwutil')
depends=('zsh' 'bitwarden-cli')
makedepends=('git')
optdepends=('keyutils: Save BW_SESSION in kernel keyring')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	PREFIX="${pkgdir}/usr" make install
}
