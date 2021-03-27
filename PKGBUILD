# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mimemagic
pkgname=ruby-$_gemname
pkgver=0.4.3
pkgrel=1
pkgdesc="Fast mime detection by extension or content in pure ruby"
arch=(x86_64)
url=https://github.com/minad/mimemagic
license=(MIT)
options=(!emptydirs)
depends=(ruby shared-mime-info ruby-nokogiri ruby-rake)
makedepends=(git rubygems ruby-rdoc)
source=(git+https://github.com/minad/mimemagic.git?tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
