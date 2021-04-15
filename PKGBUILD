# Maintainer: farawayer <farwayer@gmail.com>

_gemname=fastlane
pkgname=$_gemname
pkgver=2.180.1
pkgrel=2
pkgdesc='The easiest way to automate beta deployments and releases for your iOS and Android apps'
arch=(any)
url='https://fastlane.tools'
license=(MIT)
depends=(ruby2.7)
options=(!emptydirs)
source=(
  https://rubygems.org/downloads/$pkgname-$pkgver.gem
  fastlane
)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4065e19beb4c8a24a07915c744158f8fde28654a'
          '9adeccea67f5310de5e75026ae1aa2d168ed6b61')

package() {
  mkdir -p "$pkgdir/usr/bin"
  ruby-2.7 /usr/bin/gem install --no-user-install --no-document -i "$pkgdir/opt/$pkgname" $_gemname-$pkgver.gem
  rm -r "$pkgdir/opt/$pkgname/cache"
  install -m755 fastlane "$pkgdir/usr/bin/$pkgname"
  install -D -m644 "$pkgdir/opt/$pkgname/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
