# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=capistrano
pkgver=3.10.1
pkgrel=1
pkgdesc='A remote server automation and deployment tool written in Ruby.'
arch=(any)
url='http://capistranorb.com'
license=('MIT')
depends=('ruby' 'ruby-rake' 'ruby-sshkit' 'ruby-i18n' 'ruby-airbrussh')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('e98a86136b7d4f1ea3b7a4d904deceeeb5433a2195069c2ece3666ac5c771d66')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
