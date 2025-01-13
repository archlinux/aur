# Maintainer: Dinamyc <dinamycdinamyc at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=2.42.0
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
    sha256sums=('4179eeef833a87fdb45cc232e4e8d2d1d0a30dbc5f91f399943f7529d3633806'
                '1c13293911a8d0cf50858ed9e2c4f9d0eb8df7ae5f1760f192604cb0f1abd6e8')
elif [[ "$CARCH" == "aarch64" ]]; then
    sha256sums=('a1e2580fc283552d9586bbcd2e9dfed4f005f1f0d42a87b3895ca49d7e23c85a'
                '1c13293911a8d0cf50858ed9e2c4f9d0eb8df7ae5f1760f192604cb0f1abd6e8')
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
