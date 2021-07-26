# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=netrc
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=2
pkgdesc="Reads and writes netrc files"
arch=(any)
url=https://github.com/heroku/netrc
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest)
makedepends=(git rubygems ruby-rdoc)
source=(git+https://github.com/heroku/netrc.git?tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  # I've disabled this for now because unless you run in a clean chroot your
  # local gpp config will interfere with some encryption roundtrip tests and
  # I suspect that most folks using the AUR don't build in a clean chroot
  #
  # rake
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

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm0644 Readme.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
