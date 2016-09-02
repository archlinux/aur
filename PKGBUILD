# Maintainer: Lee Fenlan <lee@fenlan.uk>

pkgname=fira-code-git
pkgver=r1201.92df0e8
pkgrel=1
pkgdesc="Fira Code font. Monospaced font with programming ligatures"
arch=('i686' 'x86_64')
url="https://github.com/tonsky/FiraCode"
license=('custom:OFL')
makedepends=('git')
optdepends=('fontconfig: configure and customize font access'
			'xorg-font-utils: transitional package depending on xorg font utilities')
install="$pkgname".install
source=("$pkgname"::git+https://github.com/tonsky/FiraCode.git)
sha256sums=('SKIP')
validpkgkeys=(FEB63203)

pkgver() {
	cd "${srcdir}/${pkgname}" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	for i in {Bold,Light,Medium,Regular,Retina}; do
		install -Dm644 "$pkgname/distr/otf/FiraCode-$i.otf" "$pkgdir/usr/share/fonts/fira_code/FiraCode-$i.otf"
	done
	install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
