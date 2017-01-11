# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>

_gemname=commander
pkgname=ruby-$_gemname
pkgver=4.4.3
pkgrel=1
pkgdesc="The complete solution for Ruby command-line executables"
arch=('any')
url="https://rubygems.org/gems/commander"
license=('MIT')
depends=('ruby' 'ruby-highline>=1.7.2')
options=(!emptydirs)
source=("http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem"
        "https://raw.githubusercontent.com/commander-rb/commander/master/LICENSE")
noextract=($_gemname-$pkgver.gem)
sha256sums=('aedf4af6fdf8f05489001bcd70af87d83afec6896a3a2dfd9b49ec02bc391d07'
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
