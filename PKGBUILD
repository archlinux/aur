# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>
pkgname=supercronic-bin
# renovate: datasource=github-releases depName=aptible/supercronic
pkgver=0.2.50
pkgrel=1
pkgdesc='A crontab-compatible job runner, designed specifically to run in containers'
arch=(aarch64 armv7h i686 x86_64)
url='https://github.com/aptible/supercronic'
license=(MIT)
provides=(${pkgname%-bin})
conflicts=(
	${pkgname%-bin}
	${pkgname%-bin}-git
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source=("${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/aptible/supercronic/refs/tags/v${pkgver}/LICENSE.md"
		"${pkgname}-${pkgver}.README.md::https://raw.githubusercontent.com/aptible/supercronic/refs/tags/v${pkgver}/README.md")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-arm64")
source_armv7h=("${pkgname}-${pkgver}-armv7h::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-arm")
source_i686=("${pkgname}-${pkgver}-i686::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-386")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-amd64")
b2sums=('a6b6216404b1faba0feec03f5948ee5f3663288afdce33c63c159dd964f24e29197943d38c7288d446ee328e2553952dada226a41326387f2d21cca4a3b928c5'
        '696ba36fa0e26ca7d06fe4764acd4999572f3d9e26542e9bf875b3acaef19f52e76a7e0c9b66bf33a8657a20562e6d8a5f2947dd8cddfd032b0063158dd2f07c')
b2sums_aarch64=('bcc6ece9853b8b08da493efb635ea475f292e118238d3a59e9b396dec20e90ea6d702edd91b371201e8f2b1c877049a21d87caabee1cb65f1c9f7814447a08a0')
b2sums_armv7h=('74d29630af671679c29cad08882bb52dd76729d7881d82075cb02e42c58bc4547ed49043b49caaa596703b1d3b9619889136fa8c83cf09b193c25bfa14676c61')
b2sums_i686=('00f0c9ec3f9c670ab6e141db0ff60eea06bdb9bb3239d11b38476ea48b70a93f7f99b5e7013e0d65dc471db31ee7817793fb1a5258d8887a1525966ea60d90d7')
b2sums_x86_64=('38a32aab3d220d8598b3c151fe2df4ce938cfc034e464fb950e046697d959c62621f618036952d1439b08eb38b6afe714a69d2fabb1f746b14d353a15d368018')

package() {
	install -Dm755 \
		"${srcdir}/${pkgname}-${pkgver}-${CARCH}" \
		"${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.README.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/README.md"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
