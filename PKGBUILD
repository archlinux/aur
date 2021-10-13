# Maintainer: dplusdplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_gemname=gepub
pkgname="ruby-$_gemname"

pkgver=1.0.15
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
sha256sums=( "1d6aec4637a71f85366563fa68f58db229bacc61930d231c0087b47f00f2d621" )

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
