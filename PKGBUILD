# Maintainer: henning mueller <henning@orgizm.net>
# Contributor: megadriver <megadriver at gmx dot com>

_gemname=open_uri_redirections
pkgname=ruby-$_gemname
pkgver=0.1.4
pkgrel=1
pkgdesc='OpenURI patch to allow redirections between HTTP and HTTPS'
arch=(any)
url='https://github.com/jaimeiniesta/open_uri_redirections'
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  export RBENV_VERSION=system

  local _gemdir="$(ruby -e 'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

sha256sums=('f4ba5f0655ae436e19dbd9c55ef564c3ec17bead89d1d05422417634f41c4c25')
