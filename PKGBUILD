# Maintainer: P Sherbet <psherbet at psherbet dot com>
pkgname=nerd-fonts-source-code-pro
pkgver=2.0.0
pkgrel=3
pkgdesc="Patched font SourceCodePro from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils' 'wget')
install=$pkgname.install
source=("$pkgname.links"
    "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/2.0.0/LICENSE")
sha256sums=('ebfe5cfbccdd7ed303eb5cd687c59be5611a397a9bca5735c85ab2fc449bb418'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

prepare() {
    # Just download font file (complete version) from github repo because the whole repo is too big
    cd "${srcdir}"
    echo "Downloading fonts ...."
    wget -c --show-progress -i "${pkgname}.links"
}

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
