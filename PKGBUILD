# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: snap beta
# what: whatpulse

_snap=iHVATX2faqAJciG5YGNM241W8fE8UvsF

pkgname=whatpulse-bin
pkgver=3.5.10
pkgrel=1
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url=http://www.whatpulse.org
provides=("${pkgname%*-bin}=${pkgver%.*}")
conflicts=("${pkgname%*-bin}")

license=(custom:whatpulse_tos)
depends=(
	qt5-svg
)
makedepends=(squashfs-tools)
optdepends=(
    'libpcap: for capturing network statistics'
)
source=('whatpulse.desktop' LICENSE)
source_x86_64=("${pkgname%*-bin}-$pkgver.sfs::https://api.snapcraft.io/api/v1/snaps/download/${_snap}_${pkgver##*.}.snap")
sha256sums=('aba7e6b28ccebdb6115245dae1a7ca8e88afa2ecb1619037b66f65090a284363'
            'cfea47f15bb3ba2494a7b1d50367139dc12709fc1e8ba0b25d86ee5f09748619')
sha256sums_x86_64=('ffb8dae8045f6af1ab059e12372130f85455607461d25b25cb2df69366a18623')

prepare() {
	rm -rf sfs
	unsquashfs -q -i -n -d sfs \
		"${pkgname%*-bin}-$pkgver.sfs" \
		usr/bin/whatpulse \
		meta/gui/whatpulse.png
}

package() {
    install -Dm 755 sfs/usr/bin/whatpulse "${pkgdir}/usr/bin/whatpulse"
    install -Dm 644 whatpulse.desktop "${pkgdir}/usr/share/applications/whatpulse.desktop"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 sfs/meta/gui/whatpulse.png "${pkgdir}/usr/share/pixmaps/whatpulse.png"
}
