# Maintainer: basigur
# Origin: Sadrlimanov Ramil Rashitovich

pkgname=neru-icon-classic-theme
pkgver=2.7
pkgrel=9
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
            'a5ec781231da2e80199ec1191a11df5fbb495745abac4824a3ef14f5577e4bba'
            '6aa30d80f5ebe4fe95e8e083c9c0a4b304ad907fab0a5936ae0a79282da21b34')


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

