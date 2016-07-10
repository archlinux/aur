# Maintainer: James An <james@jamesan.ca>
# Contributor: Ricardo Wurmus <maintainer name + @gmail.com>

pkgname=soundcli
pkgver=0.0.5
pkgrel=3
pkgdesc='CLI client for soundcloud'
arch=('any')
url='http://soundcli.elephly.net'
license=('GPL3')
depends=(ruby-gstreamer ruby-curb ruby-json)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
#~ noextract=($pkgname-$pkgver.gem)
md5sums=('32b0ff3ef7cdfe6095a2bcb8c37b346c')

prepare() {
  # Relax dependency version restrictions to allow the latest versions.
  zcat metadata.gz | sed 's/~>/">="/' | gzip -c - >| metadata.gz~
  mv -f metadata.gz~ metadata.gz
  tar -cf "$pkgname-$pkgver.new.gem" data.tar.gz metadata.gz
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.new.gem"
  rm "$pkgdir$_gemdir/cache/$pkgname-$pkgver.gem"
}
