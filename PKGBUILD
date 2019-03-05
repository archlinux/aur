# Maintainer: Finn Behrens <finn@dsgvo.fail>
pkgname=rifo-git 
pkgver=0.2.1_r1
pkgrel=1
pkgdesc="rifo sripts"
arch=('any')
url="https://git.kloenk.de/finn/Rifo"
license=('GPL3')
groups=()
depends=(fzf jq pass termite)
optdepends=('xdotool: add support for inserting password' 'oath-toolkit: add support for totp')
makedepends=('git')
provides=("${pkgname%-VCS}" 'rifopass')
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
source=('rifo::git+https://git.kloenk.de/finn/Rifo.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/rifo"

	# Git, unannotated tags available
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/rifo"
	install -Dm0755 rifopass.sh "$pkgdir/usr/bin/rifopass"
	install -Dm0755 passlistgen.sh "$pkgdir/usr/bin/passlistgen.sh"
	install -Dm0755 rifo.sh "$pkgdir/usr/bin/rifo"
	install -Dm0755 rifo-init.sh "$pkgdir/usr/bin/rifo-init.sh"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
