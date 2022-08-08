# Maintainer: farawayer <farwayer@gmail.com>

_gemname=fastlane
pkgname=$_gemname
pkgver=2.208.0
pkgrel=1
pkgdesc='The easiest way to automate beta deployments and releases for your iOS and Android apps'
arch=(any)
url='https://fastlane.tools'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rake)
options=(!emptydirs)
source=(
  https://rubygems.org/downloads/$pkgname-$pkgver.gem
  fastlane
)
noextract=($_gemname-$pkgver.gem)
sha1sums=('ebdf12f155008329dc9582c3c126c0b6b97cab44'
          '77df078e0af5365d7a9d406e46eb5719801c46a6')

package() {
  mkdir -p "$pkgdir/usr/bin"
  gem install --no-user-install --no-document -i "$pkgdir/opt/$pkgname" $_gemname-$pkgver.gem
  rm -r "$pkgdir/opt/$pkgname/cache"
  install -m755 fastlane "$pkgdir/usr/bin/$pkgname"
  install -D -m644 "$pkgdir/opt/$pkgname/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
