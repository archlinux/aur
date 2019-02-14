# Maintainer: Mounier Florian <paradoxxx.zero@gmail.com>
# Forked from otf-fira-code-git from James Zhu <james.zhu.engineer@gmail.com>

pkgname=otf-fira-code-onum-patch
pkgver=1.206.r13.gbfe9f38
pkgrel=1
pkgdesc="Fira Code: monospaced font with programming ligatures fork to have ligatures with old-style num activated as well."
arch=('any')
url='https://github.com/paradoxxxzero/FiraCode.git'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=('otf-fira-code=1.206')
conflicts=('otf-fira-code')
makedepends=('git')
install=otf.install
source=('git+https://github.com/paradoxxxzero/FiraCode.git' 'otf.install')
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
