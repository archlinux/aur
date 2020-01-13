# Maintainer: basigur
# Origin: Sadrlimanov Ramil Rashitovich

pkgname=neru-icon-classic-theme
pkgver=2.7
pkgrel=7
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=('gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chistota/${pkgname}/archive/v${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/basigur/neru-icon-classic-theme/master/scriptspkg/neru-origin/patch.diff'
        'https://raw.githubusercontent.com/basigur/neru-icon-classic-theme/master/scriptspkg/neru-origin/fixlink.sh')
sha256sums=('f03e19d145cc7582933ac2c89cfccfd73e2a63f776fab0838629d7b98dcebfb2'
            '1a9b07a9f79550c59a44c766e143dc8f4d629aaacdbf2c74b610c72dcdad620b'
            '087a581596d0d2477c21982251517a4511881dc17f5e5c442ed42012574e5895')


prepare() {
	cd "${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}"/patch.diff
	bash "${srcdir}"/fixlink.sh
}


package() {
    cd "${pkgname}-${pkgver}"
    install -d "$pkgdir/usr/share/icons"
    cp -r */ "$pkgdir"/usr/share/icons/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md AUTHORS screenshot.svg -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

