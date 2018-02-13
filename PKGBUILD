# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

_gemname=skinny
pkgname=ruby-$_gemname
pkgver=0.2.4
pkgrel=1
pkgdesc='Simple, upgradable Thin WebSockets.'
arch=('any')
url="http://github.com/sj26/$_gemname"
license=('MIT')
depends=('ruby-eventmachine-1.0' 'ruby-thin-1.6')
makedepends=('rubygems')
provides=('$_gemname=$pkgver')
conflicts=('$_gemname')
source=("http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
md5sums=('a4eaef212a0d09644133321f60ffec94')

prepare() {
  gem unpack "$_gemname-$pkgver.gem"
  gem spec "$_gemname-$pkgver.gem" --ruby >| "$_gemname-$pkgver/$_gemname-$pkgver.gemspec"

  cd "$_gemname-$pkgver"
  gem build "$_gemname-$pkgver.gemspec"
}

package() {
  cd "$_gemname-$pkgver"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$(ruby -e'puts Gem.default_dir')" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

