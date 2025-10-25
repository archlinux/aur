# Contributor: Bertrand Bonnefoy-Claudet <bertrand@bertrandbc.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com> 

_gemname=libxml-ruby
pkgname=$_gemname
pkgver=5.0.5
pkgrel=1
pkgdesc="Provides Ruby language bindings for the GNOME Libxml2 XML toolkit"
arch=('i686' 'x86_64')
url="https://xml4r.github.io/libxml-ruby/"
license=('MIT')
depends=('ruby' 'libxml2')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('f1bc07152982df555d70159a694ee2a53539de2cdad4b3c8a447fbb15e7e4e9a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions" \( -name gem_make.out -o -name mkmf.log \) -delete
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
