# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-unicode-name
_name="${pkgname#ruby-}"
pkgver=1.14.0
pkgrel=1
pkgdesc='Unicode character names in Ruby'
arch=(any)
url="https://github.com/janlelis/${_name}"
license=('MIT')
depends=(ruby 'ruby-unicode-types')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(b350dcdeb503748c8ad05c472e8078570fbf3231a73be53431c15db10bbedbdd)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/MIT-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
