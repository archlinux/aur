# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=librarianp
pkgname=ruby-$_gemname
pkgver=1.1.2
pkgrel=1
pkgdesc="A Framework for Bundlers, used by librarian-puppet"
arch=(any)
url=https://github.com/voxpupuli/librarian
license=(MIT)
depends=(ruby ruby-thor)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/voxpupuli/librarian.git#tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd librarian
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

build() {
  cd librarian
  gem build ${_gemname}.gemspec
}

package() {
  cd librarian
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
