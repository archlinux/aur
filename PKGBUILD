# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
_commit=b2e1a0fda35d1f0575f272609bde3c9b879271ba
pkgname=bitwarden-dmenu
pkgver=1.5.5
pkgrel=1
pkgdesc="dmenu adapter for bitwarden-cli"
arch=('x86_64')
url="https://github.com/andykais/bitwarden-dmenu"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
backup=()
options=()
install=
changelog=
source=("git+${url}#commit=${_commit}")
md5sums=("SKIP")
validpgpkeys=()

#build() {
#	cd "${pkgname}-${pkgver}"
#    npm install
#}

package() {
    pushd "${srcdir}/${pkgname}"
    npm install -g --user root --prefix "${pkgdir}/usr"
    popd
    unlink "${pkgdir}/usr/lib/node_modules/${pkgname}"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib/node_modules"
    rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}/.git"
    find ${pkgdir} -name package.json -type f -exec sed -i 's/"_where": ".*",//g' {} \;
#    install -dm755 "${pkgdir}/usr/bin"
#    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
#
#    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
#    cp -a "${pkgname}-${pkgver}/." "${pkgdir}/usr/lib/${pkgname}"
}

# vim:set ts=4 sw=4 et:
