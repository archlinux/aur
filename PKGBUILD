pkgname=timetrap
pkgver=1.15.5
pkgrel=1
pkgdesc='A simple command line time tracker written in ruby. It provides an easy to use command line interface for tracking what you spend your time on'
arch=('any')
url='https://rubygems.org/gems/timetrap'
license=('MIT')
depends=('ruby'
         'ruby-chronic'
         'ruby-sequel'
         'ruby-sqlite3')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.gem::https://rubygems.org/downloads/timetrap-$pkgver.gem"
        'LICENSE::https://raw.githubusercontent.com/samg/timetrap/master/LICENSE.txt')
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('a2f13c3ed75fbe07dc62b170f32864031e8949501fcfcc63d476c4f0fc4e9a3d'
            '6edeb22c71c029d4eeb05e649ee66816de83d9072f8fde2d61ba74b317b69d91')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
