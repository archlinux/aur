# Maintainer: farawayer <farwayer@gmail.com>

_gemname=commander-fastlane
pkgname=ruby-$_gemname
pkgver=4.4.6
pkgrel=3
pkgdesc='The complete solution for Ruby command-line executables'
arch=(any)
url='https://github.com/commander-rb/commander'
license=(MIT)
depends=(
  ruby
  # 'ruby-highline<1.8' 'ruby-highline>=1.7.2'
  ruby-highline-1
)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('511d53aa9ed15950fd4a312d8c882f7ac7b87d0b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # non-HEAD version should not install any files in /usr/bin
  # rm -r "$pkgdir/usr/bin/"
}
