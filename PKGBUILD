_name="cmake-js"
pkgname="nodejs-${_name}"
pkgver="6.1.0"
pkgrel="1"
pkgdesc="A fast, simple & powerful blog framework, powered by Node.js."
arch=('any')
url="https://github.com/cmake-js/cmake-js"
license=('MIT')
depends=('nodejs' 'cmake')
makedepends=('npm')
options=(!strip)
source=("https://github.com/cmake-js/cmake-js/archive/v${pkgver}.tar.gz")
sha256sums=('bb0defbf3f0492f8bbeaed8cd01d08d5b431a23e0ea79afe890cc4beec2536d2')

# Don't extract package
noextract=('${pkgver}.tar.gz')

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    install -dm755 "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" ${_name}@${pkgver}

    # License
    cd "${_npmdir}/cmake-js"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
