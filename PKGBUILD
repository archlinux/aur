# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andrew Rabert <draje@nullsum.net>

_gemname=exifr
pkgname=ruby-${_gemname}
pkgver=1.3.9
pkgrel=1
pkgdesc="module to read EXIF from JPEG and TIFF images"
arch=(any)
url=https://github.com/remvee/exifr
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rake ruby-test-unit)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/remvee/exifr/archive/release-$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('bf2a9f5235dbe60ad700ebd9cab08ed40d4646f2d4bf14bbb83cc95cbfc1dcec')

build() {
  cd $_gemname-release-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-release-$pkgver
  rake
}

package() {
  cd $_gemname-release-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
  install -Dm0644 CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}

# vim: set ts=2 sw=2 et:
