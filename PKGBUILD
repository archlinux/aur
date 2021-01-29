# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=sshkit
pkgname=ruby-$_gemname
pkgver=1.21.2
pkgrel=1
pkgdesc="Toolkit for deploying code and assets to servers"
arch=(any)
url=https://github.com/capistrano/sshkit
license=(MIT)
depends=(ruby ruby-net-scp ruby-net-ssh)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/capistrano/sshkit.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

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

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
