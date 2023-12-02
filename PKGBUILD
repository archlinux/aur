# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-differ
_name="${pkgname#ruby-}"
pkgver=0.1.2
pkgrel=1
pkgdesc='A simple gem for generating string diffs'
arch=(any)
url="http://github.com/pvande/${_name}"
license=('custom')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem"
        "${url/github/raw.githubusercontent}/v${pkgver}/README.rdoc")
noextract=("${_name}-${pkgver}.gem")
sha256sums=('5ece6db723679a2a9861d252852ad614f1e921e32e0984b37aab70ecc3595e45'
            '22d453aaa7451eca4fb77e7f9eba4489c647ddb7aa1996d12ad344a0dcf5fdf3')

package() {
    sed -n '/^Copyright/,$p' README.rdoc \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"
}
