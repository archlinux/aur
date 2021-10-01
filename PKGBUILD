# Maintainer: jasonwryan <jasonwryan@gmail.com>
# Contributor: beest <gnubeest@zoho.com>

pkgname=motsognir
pkgver=1.0.13
pkgrel=1
pkgdesc="A robust, reliable and easy to install gopher server."
arch=('any')
url="http://motsognir.sourceforge.net/"
license=('GPL3')
depends=('glibc')
optdepends=('php: php scripting support')
source=("https://downloads.sourceforge.net/project/$pkgname/v$pkgver/$pkgname-$pkgver.tar.xz" \
        "${pkgname}.service"
		"${pkgname}.sysusers")
sha256sums=('d6903cc0ae31b8d3b95b6e42625c7298d6519074a195cedd2773c8d75c59af40'
            '8b8f6257f8da3bb9ce9ecd452536f05809e66abd82154fc18a45e6807c702306'
            'da686191e429ef51349af720203a101d5397204c189a3d222621a82455661bde')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "${pkgname}" \
		"${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.8.gz" \
		"${pkgdir}/usr/share/man/man8/${pkgname}.8.gz"
	install -Dm644 "manual.pdf" \
		"${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"
	install -Dm644 "${pkgname}.conf" \
		"${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.conf"
	install -Dm644 "${pkgname}-extmap.conf" \
		"${pkgdir}/usr/share/doc/${pkgname}/${pkgname}-extmap.conf"
	install -Dm644 ../${pkgname}.service \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -vDm 644 "../${pkgname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
