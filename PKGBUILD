# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: AsukaMinato
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=go-dsp-guitar-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A cross-platform multichannel multi-effects processor for electric guitars and other instruments"
arch=(
	'aarch64'
	'x86_64'
)
url='https://github.com/andrepxx/go-dsp-guitar'
license=('Apache')
provides=("${pkgname%-bin}" 'dsp-guitar')
conflicts=("${pkgname%-bin}" 'dsp-guitar')
depends=(
	'jack'
)
makedepends=(
	'openssl'
)
source=(
	"${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.tar.gz"
	"${pkgname%-bin}.sh"
)
sha256sums=('a39993ba8ad40ce74234e908db276841df1fd517c19385d01436d160986c77b1'
            '4e98b6c56eb55a54a3674089acaaabf767429f57ccd03960dcd2c0c5fe8c6243')
build() {
	cd "${srcdir}/${pkgname%-bin}"
	case "${CARCH}" in
        x86_64)
            rm -rf *-aarch64*
			mv dsp-linux-amd64 "${pkgname%-bin}"
			mv dsp-linux-amd64-debug "${pkgname%-bin}-debug"
        ;;
        aarch64)
            rm -rf *-amd64*
			mv dsp-linux-aarch64 "${pkgname%-bin}"
			mv dsp-linux-aarch64-debug "${pkgname%-bin}-debug"
        ;;
    esac
	rm -rf *.exe
	chmod a+r keys/*
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/opt"
	cp -r "${srcdir}/${pkgname%-bin}" -r "${pkgdir}/opt"
}