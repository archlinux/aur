# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Barry Smith <brrtsm at gmail. ddot com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>

_gemname=erubis
pkgname=ruby-$_gemname
pkgver=2.7.0
pkgrel=5
pkgdesc="A fast, secure, and very extensible implementation of eRuby."
arch=('any')
url="http://www.kuwata-lab.com/erubis/"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/kwatch/erubis/master/MIT-LICENSE")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('63653f5174a7997f6f1d6f465fbe1494dcc4bdab1fb8e635f6216989fb1148ba'
            'a86e9d1daf7dc38c7c855e9e6f771b733c0da135280b57552d1b8d5cbc387e37')

package() {
  local _gemdir
  _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$srcdir/$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
