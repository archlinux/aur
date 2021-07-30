# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>
# Contributor: Toke Høiland-Jørgensen <toke@toke.dk>
# Based on the ruby-kramdown PKGBUILD

pkgname=ruby-kramdown-rfc2629
_name="${pkgname#ruby-}"
pkgver=1.5.6
pkgrel=1
pkgdesc="An RFC2629 (XML2RFC) generating backend for Thomas Leitner's kramdown markdown parser"
arch=(any)
url='http://github.com/cabo/kramdown-rfc2629'
license=('MIT')
depends=('ruby-kramdown' 'ruby-json' 'ruby-certified')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(2c67dabfb6920765c0c3d49a2b3a9b4eb09649e152be83c3ff145288f6107259)

package() {
  local _gemdir
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install \
    -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
