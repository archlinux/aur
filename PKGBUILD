# Maintainer: fzerorubigd <fzerorubigd {AT} gmail>
_gemname=mailcatcher
pkgname=ruby-$_gemname
pkgver=0.5.10
pkgrel=2
pkgdesc="Catches mail and serves it through a dream."
arch=(any)
url="http://mailcatcher.me/"
license=('MIT')
depends=('ruby' 'ruby-activesupport' 'ruby-eventmachine' 'ruby-haml' 'ruby-mail' 'ruby-sinatra' 'ruby-sqlite3' 'ruby-thin' 'ruby-skinny')
makedepends=('rubygems')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
conflicts=('mailcatcher')
provides=('mailcatcher')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

md5sums=('8910b7d2ebee37ac51646657b30ed3f2')
