# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: <gaelic>
# Contributor: Anatoly Bashmakov anatoly at posteo dot net

pkgname=asciidoctor-pdf
pkgver=2.3.7
pkgrel=1
pkgdesc='Translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=(MIT)
makedepends=(rubygems)
depends=(
  asciidoctor
  ruby-concurrent
  ruby-matrix
  ruby-prawn-icon
  ruby-prawn-svg
  ruby-prawn-table
  ruby-prawn-templates
  ruby-treetop
)
options=(!emptydirs)

source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
sha256sums=('8dda110d1a50346f0d9b01790640d7f17b0bcb940346452143d05ec80ed58e20')

package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"

    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$pkgname-$pkgver.gem"

    install -Dm644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
    rm -rf "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/man"
}
