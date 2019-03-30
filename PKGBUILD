# Maintainer: primetoxinz

pkgname=onlykey
pkgver=5.0.0
pkgrel=1
pkgdesc="OnlyKey Chrome Desktop App"
arch=('x86_64')
url="https://onlykey.io/"
license=('custom')
#depends=('')
source=("https://s3.amazonaws.com/onlykey/apps/desktop/releases/latest/OnlyKey_${pkgver}.deb.gz"
"https://raw.githubusercontent.com/trustcrypto/trustcrypto.github.io/master/49-onlykey.rules")
sha256sums=('517d8d795b4a293b773676623997464b91e7756f1e2454b5e6c3c692fd467ed3'
'23f3d18e8c5cd02823954f0065956b69e07bbdfeac95a04589beb33a154526c0')


package() {
	bsdtar -O -xf "OnlyKey_${pkgver}"*.deb.gz data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
	
	find "${pkgdir}" -type d -exec chmod 755 {} +
	chmod 755 "${pkgdir}"/usr/share/applications/OnlyKey.desktop

	install -Dm 644 49-onlykey.rules "${pkgdir}/usr/lib/udev/rules.d/49-onlykey.rules"
}
