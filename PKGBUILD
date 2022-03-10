# Maintainer: Stick <stick@stma.is>

_gemname=rex-arch
pkgname=ruby-$_gemname
pkgver=0.1.14
pkgrel=1
pkgdesc="This library contains architecture specific information such as registers, opcodes, and stack manipulation routines."
arch=(any)
url="https://github.com/rapid7/rex-arch"
license=('BSD')
depends=(
	ruby
	ruby-rex-text
)
options=(!emptydirs)
source=(
	https://rubygems.org/downloads/$_gemname-$pkgver.gem
	https://raw.githubusercontent.com/rapid7/$_gemname/master/LICENSE
)
noextract=($_gemname-$pkgver.gem)
sha256sums=(
	'77111f85811731c3f95d571355356e9bba84bec843ad232318ef2683023129be'
	'22a0624299df52a759730e5e3c56bee73812e1760b4cd4382c29346058df4297'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
