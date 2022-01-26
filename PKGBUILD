# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=focalboard-bin
pkgver=v0.12.1
pkgrel=1
epoch=
pkgdesc="A self-hosted alternative to Trello, Notion, and Asana."
arch=(x86_64)
url="https://github.com/mattermost/focalboard"
license=('MIT')
groups=()
depends=(webkit2gtk)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/mattermost/focalboard/releases/download/${pkgver}/focalboard-linux.tar.gz"
	"focalboard.desktop"
)
noextract=()
sha256sums=('d09c42dbbfdab6bc59ef0be20a2a88bc4f9643ff8b41201ccdeeb9a2c4f18747'
            '6b35f2f2dbba5181b5b368d49b1ca5a05e07224c9f5e9e0e46079be854b8ed7d')
validpgpkeys=()

package() {
	cd focalboard-app
	mkdir -p "$pkgdir/opt/${pkgname}" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"

	# Copy data in /usr/share
	cp -r focalboard-app pack config.json "${pkgdir}/opt/${pkgname}/"
	install "${srcdir}/focalboard.desktop" "$pkgdir/usr/share/applications/"

	# Create launcher in /usr/bin
	ln -s "/opt/${pkgname}/focalboard-app" "$pkgdir/usr/bin/${pkgname}"
}
