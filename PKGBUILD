# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

pkgname=fpm
pkgver=1.18.0
pkgrel=1
pkgdesc='Effing package management! Build packages for multiple platforms (deb, rpm, etc) with great ease and sanity.'
arch=(any)
url="https://github.com/jordansissel/fpm"
license=('MIT')
depends=(
  ruby
  ruby-cabin
  ruby-backports
  ruby-arr-pm
  ruby-clamp
  ruby-rexml
  ruby-pleaserun
  ruby-stud
  ruby-erb
)
optdepends=('squashfs-tools: Support for snaps')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jordansissel/fpm/archive/v${pkgver}.tar.gz")
sha256sums=('95174a176d3955a84cfe432e283dcb24f9b063f735090fec69389af86c61d19d')

build() {
  cd $srcdir/$pkgname-$pkgver
  make gem
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $srcdir/$pkgname-$pkgver/$pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
