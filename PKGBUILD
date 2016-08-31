# Maintainer: James Zhu <james.zhu.engineer@gmail.com>

pkgname=otf-fira-code-git
pkgver=1.201.r0.g92df0e8
pkgrel=1
pkgdesc="Fira Code: monospaced font with programming ligatures."
arch=('any')
url='https://github.com/tonsky/FiraCode.git'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
install=otf.install
source=('git+https://github.com/tonsky/FiraCode.git' 'otf.install')
md5sums=('SKIP'
         '9b9dbd9712ac6fefe896f704609b659c')

_gitname=FiraCode

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_gitname"

	local weights=('Regular' 'Bold' 'Light' 'Medium' 'Retina')
	local font='FiraCode'

	for weight in ${weights[*]}; do
		local name="${font}-${weight}.otf"
		install -Dm644 "distr/otf/$name" "$pkgdir/usr/share/fonts/OTF/$name"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
