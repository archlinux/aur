# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=ruby-vnc
pkgname=ruby-$_gemname-1.0
pkgver=1.0.1
pkgrel=1
pkgdesc="A library which implements the client VNC protocol to control VNC servers."
arch=('any')
url="http://code.google.com/p/ruby-vnc/"
license=('MIT')
depends=('ruby')
conflicts=('ruby-vnc')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('5d41b2dcaeb4ce8da927279181500d41d4ef4217d2ae5d9040b673b0ddb65716e2c9b1c842e9b05e69918fd9efd9301f1bedd55a19ca593c450c340829a8a776')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" "$_gemname-$pkgver.gem"

  install -Dm644 $(find "${pkgdir}" -name COPYING) \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
