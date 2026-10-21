# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>
pkgname=supercronic-bin
# renovate: datasource=github-releases depName=aptible/supercronic
pkgver=0.2.51
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
b2sums_aarch64=('68cf57002b987768b484eeb6cda7a30511c69f5cd27284d91b9b47cd7f6df0abfc958d8bb2dab8d83e98546f7304c945ab1fcbed5b46cc189d05897fe80c411d')
b2sums_armv7h=('830b935235da26ec9bbeea601abebd747c29efe2c61024cae87f8a719364b6f8aa417816f522c487898bc81f6b9902bbf4a72ad655cd48dbaa24a4f7efac1a43')
b2sums_i686=('21f5d00f049141c61583857da3c65fb4d889adacbbe6ec41f548b8f2a1e4f6a065ae018d9eca972b3f5653db5874e49e2cd49755ce302b67dc18b8ce55bdab13')
b2sums_x86_64=('35840c59f169fff0bcdeec9d0cd1a375970f4047ecdd3faa6b6e170592bcc3db09f6ee28da0e16be1d6ee202717d00a854cea037cd61bbc3a097bc0a5e094df9')

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
