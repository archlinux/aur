# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname='organizr-git'
_pkgname='organizr'
pkgver=r3541.cf2b91b0
pkgrel=1
pkgdesc='HTPC/HomeLab services organizer (git version).'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite')
optdepends=('fail2ban')
provides=('organizr')
conflicts=('organizr')
install='organizr.install'
source=("${pkgname}::git+https://github.com/causefx/Organizr.git#branch=v2-master" "organizr.install")
sha256sums=('SKIP'
	    '0eb1fc73141105b51e6ced331057b2f2661d915878c641893c64cd28b861bc45')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    install -dm 755 "${pkgdir}/var/lib/${_pkgname}"
    
    cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/usr/share/webapps/${_pkgname}/"
    
    mv "${pkgdir}/usr/share/webapps/${_pkgname}/api" "${pkgdir}/var/lib/${_pkgname}/"
    ln -s "/var/lib/${_pkgname}/api" "${pkgdir}/usr/share/webapps/${_pkgname}/api"

    mv "${pkgdir}/usr/share/webapps/${_pkgname}/css" "${pkgdir}/var/lib/${_pkgname}/"
    ln -s "/var/lib/${_pkgname}/css" "${pkgdir}/usr/share/webapps/${_pkgname}/css"
    
    mv "${pkgdir}/usr/share/webapps/${_pkgname}/plugins" "${pkgdir}/var/lib/${_pkgname}/"
    ln -s "/var/lib/${_pkgname}/plugins" "${pkgdir}/usr/share/webapps/${_pkgname}/plugins"
}
