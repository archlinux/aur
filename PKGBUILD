# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

_pkgname=mailcatcher
pkgname=ruby-$_pkgname
pkgver=0.6.1
pkgrel=2
pkgdesc='Catches mail and serves it through a dream.'
arch=('any')
url="http://$_pkgname.me"
license=('MIT')
depends=('ruby-activesupport' 'ruby-eventmachine' 'ruby-haml' 'ruby-mail' 'ruby-sinatra' 'ruby-skinny' 'ruby-sqlite3' 'ruby-thin')
makedepends=('rubygems')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem)
md5sums=('bdeb5656e0931d1b211b52aa0f9e31f5')
noextract=($_pkgname-$pkgver.gem)

package() {
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-document --no-user-install --ignore-dependencies --install-dir "$pkgdir$_gemdir" --bindir "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"

  sed '/dependency(%q<eventmachine>/{s/"<= 1.0.5", //}' "$pkgdir/usr/lib/ruby/gems/2.2.0/specifications/$_pkgname-$pkgver.gemspec"
  sed '/dependency(%q<thin>/{s/"~> 1.5.0", /"~> 1.5"/}' "$pkgdir/usr/lib/ruby/gems/2.2.0/specifications/$_pkgname-$pkgver.gemspec"
}
