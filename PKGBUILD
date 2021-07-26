# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=cliver
pkgname=ruby-${_gemname}
pkgver=0.3.2
pkgrel=3
pkgdesc="Tools for detecting and verifying command line dependencies"
arch=(any)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-rspec-its)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/yaauie/cliver
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/yaauie/cliver.git?tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  rake spec
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
