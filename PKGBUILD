# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=IBM-Cloud
_pkgname=redli
pkgname=${_pkgname}-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="A humane alternative to the Redis-cli and TLS"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}::${_urlraw}/README.md"
        "CONTRIBUTING-${pkgver}::${_urlraw}/CONTRIBUTING.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '7cd318c33e82808d5f5725dde4fda22c310c2164585984772d544935aeac0144'
            '0dd6aab11eee247eacdb819b7982e0b489da95b1b937076196309fefc2d7c069')
sha256sums_x86_64=('17c38f4db744bd970a732e78dd4c59f40f828aa31e7c41bf2020379937d5a408')
sha256sums_aarch64=('cec8dea5f3f14ca2d09e91fffccc9b71f4a1c8a18314230902c4d2c41ad9bd42')


case `uname -m` in
	"x86_64") _CARCH="amd64"
	;;

	"aarch64") _CARCH="arm64"
	;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_linux_${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "CONTRIBUTING-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
}
