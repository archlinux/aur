# Maintainer: P Sherbet <psherbet at psherbet dot com>
pkgname=nerd-fonts-source-code-pro
pkgver=2.0.0
pkgrel=4
pkgdesc="Patched font SourceCodePro from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/SourceCodePro.zip"
    "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=('f8e0cc0aceefa97a2c3f256fbc9a460038059ef0a193f02960f644daddfdfbbb'
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
