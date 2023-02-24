# Maintainer: farawayer <farwayer@gmail.com>
# Maintainer: Axel Navarro <navarroaxel at Gmail>

_gemname=fastlane
pkgname=$_gemname
pkgver=2.212.1
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
sha256sums=('b4ea2760306816718b0c3b2b253af3c2f5f7edff32ac52a216db373f9ba8422c'
            'feb1a15a8120dd3de709d73287fd4a754dbbfb05fa839f4927b3b7d6ea9b5ee3')

package() {
  mkdir -p "$pkgdir/usr/bin"
  gem install --no-user-install --no-document -i "$pkgdir/opt/$pkgname" $_gemname-$pkgver.gem
  rm -r "$pkgdir/opt/$pkgname/cache"
  install -m755 fastlane "$pkgdir/usr/bin/$pkgname"
  install -D -m644 "$pkgdir/opt/$pkgname/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
