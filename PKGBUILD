# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='rack'
pkgname="ruby-${_gemname}-1"
pkgver=1.6.4
pkgrel=2
pkgdesc='Provides an interface for developing web applications in Ruby'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/versions/${pkgver}"
license=('MIT')
depends=('ruby' 'rubygems')
provides=("${pkgname%-*}=${pkgver}")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('609bc7671947c2abfd00f0848e1870fcf46d5a92320427bea4b7104c1dbd6d4a9d0a89e3846e774c409d570ecc8fdb8d8099e553c5d73384f10a9f6e636765ca')

package() {
  export HOME=/tmp
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "$_gemname-$pkgver.gem"
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s `find "${pkgdir}/usr/lib/ruby/" -type f -name 'COPYING' | sed "s|${pkgdir}||"` "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
