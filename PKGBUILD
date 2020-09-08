# Maintainer: Henry-Joseph Audéoud <henry-joseph.audeoud@univ-grenoble-alpes.fr>
# Based on the ruby-kramdown-rfc2629 PKGBUILD

pkgname=ruby-certified
_name="${pkgname#ruby-}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Ensure net/https verifies SSL certificates and provides certificate bundle"
arch=(any)
url="http://github.com/stevegraham/${_name}"
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem"
        "https://raw.githubusercontent.com/stevegraham/certified/master/LICENSE")
noextract=("${_name}-${pkgver}.gem")
sha256sums=('aa4cdf0e90e7ee96f6e0ce3daae39eaa8f0486124e0d92daf64d2105aeb9069c'
            'cb9124a6b92829d36efa414520772710cb598096851cdc8b5b77f0da0b19f27a')

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"
}
