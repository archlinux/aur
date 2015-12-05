# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: gem2arch (https://github.com/anatol/gem2arch)

_gemname=einhorn
pkgname=ruby-$_gemname
pkgver=0.6.4
pkgrel=1
pkgdesc='Language-independent shared socket manager'
arch=('any')
url='https://github.com/stripe/einhorn'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('89540e55b54b29ed7d846230e52e3178beef1c5a9962131131df3bac7acd541f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
