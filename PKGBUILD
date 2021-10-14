# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=rdoc
pkgname=ruby27-$_gemname
pkgver=6.3.1
pkgrel=1
pkgdesc='Command-line documentation generator for Ruby projects'
arch=(any)
url='https://ruby.github.io/rdoc/'
license=(MIT)
depends=(ruby2.7)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('78bb8a7dce31bb384ce2c761bf30b0169d11513c334df176112565a5989d97ce2247be138e11ef2c23df6c01af58cfcd80c7755ca2d19173be9e4b7d31e0d900')

package() {
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"
  gem-2.7 install --ignore-dependencies --no-user-install --no-document --install-dir "$pkgdir/$_gemdir" --bindir "$pkgdir/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm 644 "${pkgdir}/usr/lib/ruby/gems/2.7.0/gems/${_gemname}-${pkgver}/LICENSE.rdoc" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv "${pkgdir}/usr/bin/rdoc" "${pkgdir}/usr/bin/ruby27-rdoc"
  mv "${pkgdir}/usr/bin/ri" "${pkgdir}/usr/bin/ruby27-ri"
}
