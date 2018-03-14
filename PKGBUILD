# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=domain_name
pkgname=ruby-$_gemname
epoch=1
pkgver=0.5.20170404
pkgrel=1
pkgdesc='This is a Domain Name manipulation library for Ruby. It can also be used for cookie domain validation based on the Public Suffix List.'
arch=('any')
url='https://github.com/knu/ruby-domain_name'
license=('BSD-2-Clause' 'BSD-3-Clause' 'MPL-1.1' 'GPL-2.0' 'LGPL-2.1')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-unf')
makedepends=('ruby-rdoc')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('6e8e5cf80b9fdfae3ef730e73a30bce5da0a1e4a70f6e0a0b8672a28a3471a8a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
