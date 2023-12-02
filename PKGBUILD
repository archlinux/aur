# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-unicode-name
_name="${pkgname#ruby-}"
pkgver=1.12.0
pkgrel=1
pkgdesc='[Unicode 15.1.0] Returns the name, aliases, or label of a Unicode code point'
arch=(any)
url="https://github.com/janlelis/${_name}"
license=('MIT')
depends=(ruby 'ruby-unicode-types>=1.9')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(e6d5b6fc2809d1cfdca263194fc6a8be16ede4ea515be0399d2736e0c510e704)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/MIT-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
