# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=scss_lint
pkgname=ruby-$_gemname
pkgver=0.59.0
pkgrel=1
pkgdesc='Configurable tool for writing clean and consistent SCSS.'
arch=('any')
url='https://github.com/brigade/scss-lint'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=(ruby ruby-sass)
makedepends=(rubygems ruby-rdoc)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('67fbe3dc39cf6295147ea5093b3a1b6c0fe26dbcfcbd4823c3d5de64c9fccde8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
