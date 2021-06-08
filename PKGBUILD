# Maintainer: Mark Stenglein <aur@markstenglein.com>

_gemname=circleci
pkgname=ruby-$_gemname
pkgver=2.0.3
pkgrel=1
pkgdesc='Ruby gem for Circle CI REST API'
arch=(any)
url='https://github.com/mtchavez/circleci/'
license=(MIT)
depends=('ruby')
makedepends=('rubygems')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem"
        "https://raw.githubusercontent.com/mtchavez/$_gemname/v$pkgver/LICENSE")
noextract=($_gemname-$pkgver.gem)
sha256sums=('4e9719a8fd63ad48058bed82aec9d1885bd88a386491bb19dfc46591ce3159dd'
            '21366ef752c0c7fbf91c46ff163212d3991c6f31cf5edd216467966c50783e7e')
changelog=CHANGELOG.md

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
