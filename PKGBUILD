# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ruby-jsonpath
_gemname=jsonpath
pkgver=1.0.5
pkgrel=1
pkgdesc='Ruby implementation of http://goessner.net/articles/JsonPath'
arch=('any')
url='https://github.com/joshbuddy/jsonpath'
license=('MIT')
depends=('ruby-multi_json')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.gem::https://rubygems.org/downloads/$_gemname-$pkgver.gem"
        'LICENSE::https://github.com/joshbuddy/jsonpath/raw/master/LICENSE.md')
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('185d657cb4533a4fad4b6407a7b10eba0d2f654f699b9d9f714a65de4e988faf'
            'f8d08617b73c9c304c8543b9b87e354e02468bd02982ae4406283e7a6e29ec02')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" ${pkgname}-${pkgver}.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}