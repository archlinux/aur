# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-unicode-name
_name="${pkgname#ruby-}"
pkgver=1.13.3
pkgrel=1
pkgdesc='[Unicode 15.1.0] Returns the name, aliases, or label of a Unicode code point'
arch=(any)
url="https://github.com/janlelis/${_name}"
license=('MIT')
depends=(ruby 'ruby-unicode-types')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(cd3c3d68604a4db1f385bdb5c674d2cdddf1d39eaf60ebc0c71b92c8a6df7abd)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/MIT-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
