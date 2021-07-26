# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mimemagic
pkgname=ruby-$_gemname
pkgver=0.4.3
pkgrel=2
pkgdesc="Fast mime detection by extension or content in pure ruby"
arch=(x86_64)
url=https://github.com/mimemagicrb/mimemagic
license=(MIT)
options=(!emptydirs)
depends=(ruby shared-mime-info ruby-nokogiri ruby-rake)
checkdepends=(ruby-minitest)
makedepends=(git rubygems ruby-rdoc)
source=(git+https://github.com/minad/mimemagic.git?tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  RUBYARCHDIR=./lib rake
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
