# Maintainer: fubarhouse
pkgname=pygmy-legacy
provides=(pygmy-legacy)
pkgver=0.9.11
pkgrel=2
pkgdesc="The Legacy version of Amazee.io's local docker development tool 'Pygmy' written in Ruby."
arch=('x86_64')
url="https://github.com/amazeeio/pygmy-legacy"
license=('MIT')
depends=('ruby2.6')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amazeeio/pygmy-legacy/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c06567ac2fa7b6e21a905d8e9d6d46efe476e654b285f0baaaa1459a867bd889c5f2852931d724d3e50f2f48f17252ccc730ef0734e343114b4e872a525097d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/'pygmy'/'pygmy-legacy'/" ./pygmy.gemspec
  mv ./bin/pygmy ./bin/pygmy-legacy
  gem-2.6 build "pygmy.gemspec" -o "${pkgname}-${pkgver}.gem"
}

package() {
  local _gemdir="$(ruby-2.6 -e'puts Gem.default_dir')"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  gem-2.6 install --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.gem"
}

