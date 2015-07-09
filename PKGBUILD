# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>

_gemname=commander
_pkgname=ruby-$_gemname
pkgname=$_pkgname-4.2.1
pkgver=4.2.1
pkgrel=1
pkgdesc="The complete solution for Ruby command-line executables, version 4.2.1"
arch=('any')
url="https://rubygems.org/gems/commander"
license=('MIT')
depends=('ruby' 'ruby-highline>1.6.11')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
options=(!emptydirs)
source=("http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem"
        "https://raw.githubusercontent.com/commander-rb/commander/master/LICENSE")
noextract=($_gemname-$pkgver.gem)
sha256sums=('8ccbe07c5f389323c03678ff03ab5d4b467c37067a2c21ff079bc365b9868eff'
            'd1c0118f15b4e197c63ce1894a1f72f786020adad84a0930157dc0f74c38e0c0')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
