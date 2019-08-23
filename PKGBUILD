# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Markdown FastCGI server'
pkgname=turnstile
pkgver=0.0.2
pkgrel=1
url=https://github.com/roryrjb/turnstile
license=(custom:MIT)
arch=(x86_64)
depends=(discount fcgi)
makedepends=()
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('eb7a6fcf560be8967e9172116a5d9a808cde5272445dd6c10a86d976eb48e237351f07e0ac1f9fadac38e17fe67b85325e6f64f31b82ce181803ddd810b82f6a')

build ()
{
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr -j$(nproc)
}

package ()
{
	cd "${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" turnstile
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" turnstile.service
}
