# Maintainer: dplusdplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_gemname=gepub
pkgname="ruby-$_gemname"

pkgver=2.0.1
pkgrel=1
pkgdesc="gepub is a generic EPUB parser/generator. Generates and parse EPUB2 and EPUB3"

arch=( x86_64 )
url="https://github.com/skoji/gepub"
license=( "BSD" )
depends=( "ruby"
"ruby-nokogiri"
"ruby-rubyzip"
)


options=(!emptydirs)
source=( "https://rubygems.org/downloads/$_gemname-$pkgver.gem" )
noextract=( "$_gemname-$pkgver.gem" )
sha256sums=( "b7f2667d6edcb034b8e8809293b245b62b2815de12b950ad4a282bcafe73b15b" )

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
