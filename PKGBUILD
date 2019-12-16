# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname='organizr-git'
_pkgname='organizr'
pkgver=r2028.cdc55ce8
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
source=("${pkgname}::git+https://github.com/causefx/Organizr.git#branch=v2-master" "organizr.install" "organizr.tmpfiles")
sha256sums=('SKIP'
            'ae58bcf26a81ac31bc73cc01cf41ce8451b4a279032caee51e4a10470f74bb9f'
	    '6a496d0eebd685ddb499eb20d6f12e18c825c9e07e27c0ffe04b10b2fc0706e5')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m 644 "${srcdir}/organizr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/organizr.conf"
    install -dm 755 "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${_pkgname}/"
}
