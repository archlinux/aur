# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=pvs
pkgver=7.1.0
pkgrel=4
pkgdesc="Mechanized environment for formal specification and verification"
arch=('x86_64')
url="https://pvs.csl.sri.com"
provides=('pvs')
source=("https://pvs.csl.sri.com/downloads/${pkgname}${pkgver}-i${CARCH}-Linux-allegro.tgz"
'install-sh.patch')
sha256sums=('1056856ccd1702a957bb96e374f2f859f3fd41f384aa39db0c04a548121a26c1'
 '40a714bc1ef84fc4c55f5315f673a05b42b041f7a2af2657c33f48cb360060fe')
depends=('emacs')
install='path.install'

build () {
    # Build
    cd "$pkgname-$pkgver"
    patch ./install-sh < "${srcdir}/install-sh.patch"
    ./install-sh
}

package() {
    # Install to opt to avoid naming conflicts (e.g. lvm2 conflicts with 'pvs')
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/opt/${pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
