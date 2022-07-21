# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Nikita Nikishin <i.nnikishi@gmail.com>
# Contributor: Christian Mauderer <oss@c-mauderer.de>
# Contributor: Jonas Strassel <jo.strassel@gmail.com>

pkgname=pdfbeads
pkgver=1.1.3
pkgrel=2
pkgdesc="A small utility written in Ruby which takes scanned page images and converts them into a single PDF file"
arch=('any')
url='https://github.com/akryukov/pdfbeads'
license=('GPL')

depends=(
'ruby'
'openjpeg2'
'imagemagick'
'ruby-rmagick'
'ruby-nokogiri'
'ruby-pdf-reader'
'ruby-rdoc'
)

optdepends=(
'jbig2enc: for better JPEG2000 compression'
'ruby-iconv'
)

source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=($pkgname-$pkgver.gem)
sha256sums=('b47d86dbc338c56728e2144260001cef883a6ce270145684648539d083342f88')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
