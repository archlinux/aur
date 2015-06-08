# Maintainer: Jonne Haß <me@jhass.eu>

pkgname=ruby2.0-bundler
_gemname=${pkgname#ruby2.0-}
pkgver=1.10.3
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.0')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('9c2c7093468c763eeadad47dae9de4d7ed2e6f08e80a130d1b0d6db6a46608cc')

package() {
  cd "${srcdir}"

  local _gemdir="$(ruby-2.0 -rubygems -e'puts Gem.default_dir')"
  HOME=/tmp GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem-2.0 install --no-user-install --ignore-dependencies \
    --no-ri --no-rdoc -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem

  install -d $pkgdir/usr/bin/
  ln -s $_gemdir/bin/bundle $pkgdir/usr/bin/bundle-2.0
}
