# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-unicode-scripts
_name="${pkgname#ruby-}"
pkgver=1.9.0
pkgrel=1
pkgdesc='[Unicode 15.1.0] Retrieve the Unicode script(s) a string belongs to. Can also return the Script_Extension property which is defined as characters which are '"'"'commonly used with more than one script, but with a limited number of scripts'"'"'. '
arch=(any)
url="https://github.com/janlelis/${_name}"
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(b9c9fbaf405b67f9fa3bbadcc66bbb539f5148c9b11126c23038655bb4665d54)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/MIT-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
