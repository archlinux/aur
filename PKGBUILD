# Maintainer: Helloagain <nospamming11+arch at gmail dot com>

pkgname=firecamp-appimage
pkgver=3.3.0_beta.3
pkgrel=1
pkgdesc="Developer-first OpenSource API DevTool, Postman/Insomnia alternative"
arch=('x86_64')
url="https://github.com/firecamp-dev/firecamp"
license=('AGPL-3.0-or-later')
groups=()
depends=(
	'fuse2'
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(
	'firecamp'
)
replaces=()
backup=()
options=(
	'!strip' # AppImage
)
install=
changelog=
source=(
	"firecamp.AppImage::https://github.com/firecamp-dev/firecamp/releases/download/v${pkgver//_/-}/Firecamp-${pkgver//_/-}.x86_64.AppImage"
	"firecamp.svg::https://raw.githubusercontent.com/firecamp-dev/firecamp/main/.github/logo.svg"
	"firecamp.desktop"
)
noextract=()
sha256sums=(
	"e7dfdbb3df963c3e4c186327530d76dbbb677260d15e5b3e19187b5992ef71ed"
	"f8d063b62f694acc7d1a54ecc8d8777b5c20aa70fe347db830a32cec28da9cc3"
	"60244c18c4f17d481307eb777d26535a60791ff7b62a34a235908c07a7fc9f9e"
)

package() {
	# Get prefixed application directory
	_bin_dir="$pkgdir/usr/bin"
	_rooted_application="/usr/share/$pkgname"
	_main_application="$pkgdir$_rooted_application"

	install -m 755 -d "$_main_application"
	install -Dm 755 "$srcdir/firecamp.AppImage" "$_main_application/firecamp.AppImage"
	install -Dm 444 "$srcdir/firecamp.svg" "$_main_application/firecamp.svg"

	install -Dm 644 "$srcdir/firecamp.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

		# create symlink for binar
  mkdir -p "$_bin_dir"
	ln -s "$_rooted_application/firecamp.AppImage" "$_bin_dir/$pkgname"
}
