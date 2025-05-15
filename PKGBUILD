# Maintainer: Louis Dalibard <ontake@ontake.dev>
# Contributor: Louis Dalibard <ontake@ontake.dev>
_pkgbase="ontake-copybara"
pkgname="$_pkgbase-git"
pkgver=r23.g8690a9b
pkgrel=1
pkgdesc="A Wayland clipboard automation tool "
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/make-42/copybara"
license=('MIT')
groups=()
depends=('wl-clipboard')
makedepends=('go>=1.18' 'git')
optdepends=()
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/make-42/copybara")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

pkgver() {
	cd ${srcdir}/copybara
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/copybara"
	go mod download
	go build
}
	
package() {
	cd ${srcdir}
	install -Dm755 "copybara/copybara" "${pkgdir}"/usr/bin/copybara
}
