# Maintainer: Takashi INOUE <inoue at pitan dot org>
pkgname=nerd-fonts-mplus
pkgver=1.0.0
pkgrel=1
pkgdesc="Patched font Mplus from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils' 'wget')
install=$pkgname.install
source=("$pkgname.links"
	"https://github.com/ryanoasis/nerd-fonts/raw/v1.0.0/LICENSE")
sha256sums=(
    '57d29f70ab4d841b5c4784b974099f91c9252c0b782b573b27e0e8abfa9443d6'
    '25f0b18305451ab7353c534098d9daf4051fbedfac6d5ef9be5de42e007e1c3f')

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
