# Maintainer: Super Bo <supernbo@gmail.com>
pkgname=nerd-fonts-complete
pkgver=1.0.0
pkgrel=1
pkgdesc="collection of over 20 patched fonts (complete variant) for powerline, devicons, and vim-devicons: includes Droid Sans, Meslo, AnonymousPro, ProFont, Inconsolta, and many more"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
conflicts=(nerd-fonts-git)
install=$pkgname.install
source=("$pkgname.links"
	"https://github.com/ryanoasis/nerd-fonts/raw/v1.0.0/LICENSE")
sha256sums=(
	'0ac47a1532911d35f76f7eb95e42be73302a11d240021570dce15d2bda22040d'
	'25f0b18305451ab7353c534098d9daf4051fbedfac6d5ef9be5de42e007e1c3f')

prepare() {
	# Just download font file (complete version) from github repo because the whole repo is too big
	cd "${srcdir}"
	echo "Downloading fonts ...."
	wget -c --show-progress -i "${pkgname}.links"
}

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/OTF
    install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
