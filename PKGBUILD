# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=i3-agenda-git
pkgver=1.8.r0.g65fa0e8
pkgrel=1
pkgdesc=" Show your next google calendar event in polybar or i3-bar"
arch=('any')
url="https://github.com/rosenpin/i3-agenda"
license=('Unlicense')
groups=()
depends=("python-bidi"
	"python-google-api-python-client"
	"python-google-auth-httplib2"
	"python-google-auth-oauthlib"
	"python-aiohttp"
	"python-typing_extensions"
)
makedepends=("python-setuptools" "git")
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	 python -m  build
}

package() {
	cd "$srcdir/$pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
