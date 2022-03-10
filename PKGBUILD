# Maintainer: Stick <stick@stma.is>

_gemname=rex-bin_tools
pkgname=ruby-$_gemname
pkgver=0.1.8
pkgrel=1
pkgdesc="A suite of tools for analyzing Elf,Mach, and PE format executables to find specific chunks of code."
arch=(any)
url="https://github.com/rapid7/rex-bin_tools"
license=('BSD')
depends=(
	ruby
	ruby-metasm
	ruby-rex-arch
	ruby-rex-core
	ruby-rex-struct2
	ruby-rex-text
)
options=(!emptydirs)
source=(
	https://rubygems.org/downloads/$_gemname-$pkgver.gem
	https://raw.githubusercontent.com/rapid7/$_gemname/master/LICENSE
)
noextract=($_gemname-$pkgver.gem)
sha256sums=(
	'f2e13761500d03c445bee90e28457711aeaddf065882992e94ad47f50114b95c'
	'22a0624299df52a759730e5e3c56bee73812e1760b4cd4382c29346058df4297'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
