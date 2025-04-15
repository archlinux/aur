# Maintainer: Dinamyc <dinamycdinamyc at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=2.71.0
pkgrel=1
pkgdesc="Unofficial Warp Client for Windows/Mac/Linux (Pre-compiled version)"
arch=('x86_64' 'aarch64')
url="https://github.com/bepass-org/oblivion-desktop"
license=("custom:${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils' 'polkit')
optdepends=('libappindicator-gtk3: systray and indicator support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")

if [[ "$CARCH" == "x86_64" ]]; then
    sarch="amd64"
elif [[ "$CARCH" == "aarch64" ]]; then
    sarch="arm64"
fi


# all sources
source=(
    "${pkgname%-bin}-${pkgver//_/-}-${sarch}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-${sarch}.deb"
    "https://raw.githubusercontent.com/bepass-org/${pkgname%-bin}/refs/tags/v${pkgver//_/-}/LICENSE.md"
)

# Initialize the sha256sums array
if [[ "$CARCH" == "x86_64" ]]; then
    sha256sums=('e3c5f3e72e6fe6963c4059a5fdd0af88669d4d9b01d232c4fbc6c9e6214e7429'
                '1030cbd64a888ed7b945ba92fa9468fc3f29176e86f046f5cc620c68a6cfde64')
elif [[ "$CARCH" == "aarch64" ]]; then
    sha256sums=('f61f52b077b4d82abc719a9ee5c5319d515e85dc497ad08b23281b69e4f66ae7'
                '1030cbd64a888ed7b945ba92fa9468fc3f29176e86f046f5cc620c68a6cfde64')
else
    echo "Unsupported architecture: $CARCH"
    exit 1
fi

package() {
	cd "${pkgdir}"

	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

}
# vim:set ts=4 sw=4 et:
