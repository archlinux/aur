# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

_gemname=fpm
pkgname=$_gemname
pkgver=1.17.0
pkgrel=1
pkgdesc='Effing package management! Build packages for multiple platforms (deb, rpm, etc) with great ease and sanity.'
arch=(any)
url="https://github.com/jordansissel/${_gemname}"
license=('MIT')
depends=(ruby
         ruby-cabin
         ruby-backports
         ruby-arr-pm
         ruby-clamp
         ruby-rexml
         ruby-pleaserun
         ruby-stud)
optdepends=('squashfs-tools: Support for snaps')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jordansissel/fpm/archive/v${pkgver}.tar.gz")
sha256sums=('006abf20b88261a96a64adf473d78f1bd4361265d909b2357cb506629258dd06')

build() {
  cd $srcdir/$_gemname-$pkgver
  make gem
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $srcdir/$_gemname-$pkgver/$_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
