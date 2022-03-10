# Maintainer: Stick <stick@stma.is>

_gemname=rex-core
pkgname=ruby-$_gemname
pkgver=0.1.26
pkgrel=3
pkgdesc="Core libraries required for the Ruby Exploitation (Rex) Suite."
arch=(any)
url="https://github.com/rapid7/rex-core"
license=('BSD')
depends=(ruby)
options=(!emptydirs)
source=(
	https://rubygems.org/downloads/$_gemname-$pkgver.gem
	https://raw.githubusercontent.com/rapid7/$_gemname/master/LICENSE
)
noextract=($_gemname-$pkgver.gem)
sha256sums=(
	'a091ca3ee8ca39a1a5f4ec823c11a145348e55d2e49129c104a82c6e30384cc2'
	'22a0624299df52a759730e5e3c56bee73812e1760b4cd4382c29346058df4297'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
