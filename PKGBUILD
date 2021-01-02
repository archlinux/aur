# Maintainer: basigur
# Origin: Sadrlimanov Ramil Rashitovich

pkgname=neru-icon-classic-theme
pkgver=2.7
pkgrel=14
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=('gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/basigur/neru-icon-classic-theme/master/scriptspkg/neru-origin/neru-dark.diff'
        'https://raw.githubusercontent.com/basigur/neru-icon-classic-theme/master/scriptspkg/neru-origin/patch.diff'
        'https://raw.githubusercontent.com/basigur/neru-icon-classic-theme/master/scriptspkg/neru-origin/fixlink.sh')
sha256sums=('f03e19d145cc7582933ac2c89cfccfd73e2a63f776fab0838629d7b98dcebfb2'
            'ab2e66b5d52086dcde3656f6b262124796811881de38722733f6459047ab62c4'
            'c72cfe9294e8820d2ab7c2f03cd1b9b25d39710e83d0f37fc740e6ece3191db7'
            'f17dfa4d010a202a8a034c16f47e72ee9004d673ff9ff1319b7151a4ea06882c')


prepare() {
	cd "${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}"/patch.diff
	patch -Np1 -i "${srcdir}"/neru-dark.diff
	bash "${srcdir}"/fixlink.sh
}


package() {
    cd "${pkgname}-${pkgver}"
    install -d "$pkgdir/usr/share/icons"
    cp -r */ "$pkgdir"/usr/share/icons/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md AUTHORS screenshot.svg -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

