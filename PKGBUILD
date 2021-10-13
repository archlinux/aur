# Maintainer: dplusdplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_gemname=asciidoctor-epub3
pkgname="ruby-$_gemname"

pkgver=1.5.1
pkgrel=1
pkgdesc="An extension for Asciidoctor that converts AsciiDoc documents to EPUB3 and KF8/MOBI (Kindle) e-book archives"

arch=( x86_64 )
url="https://github.com/asciidoctor/asciidoctor-epub3"
license=( "MIT" )
depends=( "ruby"
"asciidoctor"
"ruby-gepub"
"ruby-mime-types"
)


options=(!emptydirs)
source=( "https://rubygems.org/downloads/$_gemname-$pkgver.gem" )
noextract=( "$_gemname-$pkgver.gem" )
sha256sums=( "efff22bcd2e8562f8ab0df7e13de0247dd8edb3fc41e6286b36ca330c5a69e16" )

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
