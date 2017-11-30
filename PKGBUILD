# Maintainer: SrKaysama <srkaysama@waifu.club>

pkgname=spoticord
pkgver=0.0.3
pkgrel=1
pkgdesc='Display your current Spotify song on Discord using the RPC API'
arch=( 'x86_64' )
url='https://github.com/nations/spoticord/'
provides=('spoticord')
depends=('nodejs>=8' 'discord' 'spotify>=1')
makedepends=('npm>=5')
source=('git+https://github.com/nations/spoticord.git' spoticord.sh )
options=(emptydirs)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    _version="$(cat README.md | head -n 1 | sed 's/# spoticord.\{2\}//' | cut -c-5 )"
    echo "${_version}"
}

package(){
    cd "${pkgname}"
    npm i

    # Files
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a . "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/"

    # Exec
    chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}.sh"

    # Bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}