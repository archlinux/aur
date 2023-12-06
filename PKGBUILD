# Maintainer:
# Contributor: Pat Brisbin <pbrisbin@gmail.com>

_gemname="kramdown-man"
_pkgname="ruby-$_gemname"
pkgname="$_pkgname"
pkgver=1.0.1
pkgrel=1
pkgdesc="A Kramdown converter for converting Markdown files into man pages"
url="https://github.com/postmodern/kramdown-man"
license=('MIT')
arch=(any)

depends=('ruby' 'ruby-kramdown')
makedepends=('rubygems')

_pkgsrc="$_gemname-$pkgver"
source=("https://rubygems.org/downloads/$_pkgsrc.gem")
sha256sums=('02bd10f8def4b2cd9298fa10b1ffaae4d3c2499416b5a66d4040afb0d41c91ae')

noextract=("$_pkgsrc.gem")

prepare() {
  bsdtar xf "$_pkgsrc.gem" -- data.tar.gz
  bsdtar xf data.tar.gz -- LICENSE.txt
  mv LICENSE.txt LICENSE
}

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"

  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "${pkgdir:?}${_gemdir:?}" \
    -n "$pkgdir/usr/bin" \
    "$_pkgsrc.gem"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
