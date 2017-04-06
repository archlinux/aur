# Maintainer: Husam Bilal <husam212@gmail.com>

_gemname=rubygems-tasks
pkgname=ruby-$_gemname
pkgver=0.2.4
pkgrel=1
pkgdesc='Agnostic and unobtrusive Rake tasks for managing and releasing Ruby Gems.'
arch=(any)
url='https://github.com/postmodern/rubygems-tasks'
license=(MIT)
depends=(ruby ruby-rspec ruby-yard)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('52fc573970545df3f3bb586922c026bf711fdb903b38521bb6f4b14571219799')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

