# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

_gemname=ssh_scan
pkgname=ruby-$_gemname
pkgver=0.0.35
pkgrel=1
pkgdesc='prototype SSH configuration and policy scanner'
arch=('any')
url='https://github.com/mozilla/ssh_scan'
license=('MPL')
depends=(
  'ruby-bindata>=2'
  'ruby-netaddr'
  'ruby-net-ssh>=4.2'
  'ruby-net-ssh<5'
  'ruby-sshkey'
)
makedepends=('ruby-rdoc')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('acc83015f94bc77be0827a1522a648a1736b055c85e11c6c5af44553cdf47451')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  # shellcheck disable=2154
  gem \
    install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  rmdir \
    "$pkgdir/usr/lib/ruby/gems/2.5.0/extensions" \
    "$pkgdir/usr/lib/ruby/gems/2.5.0/cache" \
    "$pkgdir/usr/lib/ruby/gems/2.5.0/build_info"
}
