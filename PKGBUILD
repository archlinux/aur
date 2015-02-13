# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

_gemname=mailcatcher
pkgname=ruby-$_gemname
pkgver=0.6.1
pkgrel=1
pkgdesc='Catches mail and serves it through a dream.'
arch=('any')
url="http://$_gemname.me"
license=('MIT')
depends=('ruby-activesupport' 'ruby-eventmachine' 'ruby-haml' 'ruby-mail' 'ruby-sinatra' 'ruby-skinny' 'ruby-sqlite3' 'ruby-thin')
makedepends=('rubygems')
provides=("$_gemname")
conflicts=("$_gemname")
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
md5sums=('bdeb5656e0931d1b211b52aa0f9e31f5')
noextract=($_gemname-$pkgver.gem)

package() {
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
