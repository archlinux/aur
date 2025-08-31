# Maintainer: Whyme Lyu <callme5long@gmail.com>

pkgname=izwu
_gemname=$pkgname
pkgver=0.1.2
pkgrel=2
pkgdesc='Automating "Is it worth upgrading my OS?"'
url=https://github.com/5long/izwu
arch=(any)
license=(MIT)
depends=(
  expac
  ruby
)
checkdepends=(
  ruby-rake
  ruby-minitest
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  install -D --mode=644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -D --mode=644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
sha256sums=('d5f401be8c443465b2645948840858a0790f674a23a00be354b4adb51f740c82')
