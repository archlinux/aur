# Maintainer: P Sherbet <psherbet at psherbet dot com>
pkgname=nerd-fonts-source-code-pro
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font SourceCodePro from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig')
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/SourceCodePro.zip"
    "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=('a771689e0bc1d020e2082c705e2fb6113b7f8fbc1c56c639957f12546bd39619'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

prepare() {
    cd ${srcdir}
    find -iname '*windows*' -print0 | xargs -0 rm # the windows compatible fonts are not necessary on linux ;)
}

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/${pkgname}-${pkgver}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
