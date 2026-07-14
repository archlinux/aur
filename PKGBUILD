# Maintainer: Afonso Neto <afonso.pontesneto@gmail.com>
pkgname=fuso
pkgver=0.1.2
pkgrel=1
pkgdesc='A dead-simple terminal time tracker'
arch=('any')
url='https://github.com/AfonsoNeto/fuso-tui'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('ceac27e5a192c50ced57c8227a85163b18863cf99e55eaed4ae9b6d9243007eb')

package() {
  local _gemdir
  _gemdir="$(ruby -e 'puts Gem.default_dir')"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}/${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "${pkgname}-${pkgver}.gem"

  # Remove cached gem and build metadata
  rm -rf "${pkgdir}/${_gemdir}/cache"

  # Install license
  install -vDm 644 \
    "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
