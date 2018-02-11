# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com> 

_gemname=libxml-ruby
pkgname=$_gemname
pkgver=3.1.0
pkgrel=1
pkgdesc="Provides Ruby language bindings for the GNOME Libxml2 XML toolkit"
arch=('i686' 'x86_64')
url="http://xml4r.github.com/libxml-ruby"
license=('MIT')
depends=('ruby' 'libxml2')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('2d6305fabbfb9e52b8e5d8f8797c1b3a0ee90ff498684fb44555dd79e33ff5e4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions" \( -name gem_make.out -o -name mkmf.log \) -delete
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
