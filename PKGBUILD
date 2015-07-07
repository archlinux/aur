# Maintainer: Olivier Biesmans <olivier at biesmans dot fr>
_gemname=pleaserun
pkgname=$_gemname
pkgver=0.0.4
pkgrel=1
pkgdesc="0.0.4"
arch=(any)
url="https://github.com/jordansissel/pleaserun"
license=('APACHE')
depends=("ruby" "ruby-cabin" "ruby-clamp" "ruby-stud" "ruby-mustache" "ruby-insist" "ruby-ohai")

source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem
  detector.patch)
noextra=($_gemname-$pkgver.gem)
sha256sums=('9b2fffeda74271f765ee1ce6a85b446e04a321efdf363f8a9f4519404238bce5'
 '3958e3156dc4c61ab33ffd6f255cf42d6dde97b4d861bf2100df427f0afd1e92')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
  patch -d $pkgdir -p1 < detector.patch
}

# vim:set ts=2 sw=2 et:
