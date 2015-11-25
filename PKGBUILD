# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=ruby-vnc
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc="A library which implements the client VNC protocol to control VNC servers."
arch=('any')
url="http://code.google.com/p/ruby-vnc/"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('138f44d9cfe844397b26153d2c5e55e074f69925f81d1b3f860b9ef20d8fdf792bc1c2fbb3430827c1023e9437a320e97e19f3dce65c912dee8c9185fe53f683')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "$_gemname-$pkgver.gem"

  install -Dm644 $(find "${pkgdir}" -name COPYING) \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
