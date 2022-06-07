# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='rack'
pkgname="ruby-${_gemname}-1"
pkgver=1.6.13
pkgrel=1
pkgdesc='Provides an interface for developing web applications in Ruby'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/versions/${pkgver}"
license=('MIT')
depends=('ruby' 'rubygems')
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")   # Conflicts with /usr/bin/rackup
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('c1bdfa1149bb43a667965a0ca63f5bf2ee0b3c4446122cacd4671cee72d96edba0fe72fc284ab1dc02d4b4fe3c924824ec3cdd109c7ed915608e0eba5c19bce4')

package() {
  export HOME=/tmp
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "$_gemname-$pkgver.gem"
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s `find "${pkgdir}/usr/lib/ruby/" -type f -name 'COPYING' | sed "s|${pkgdir}||"` "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
