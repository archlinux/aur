# Maintainer: Louis Dalibard <ontake@ontake.dev>
_pkgbase="ontake-leech"
pkgname="$_pkgbase-git"
pkgver=r11.gd38556b
pkgrel=1
pkgdesc="A simple HTTP(S) file hosting server with a simple UI."
arch=("x86_64" "armv7h" "aarch64")
url="https://git.ontake.dev/go/leech"
license=('GPL3')
groups=()
depends=()
makedepends=('go>=1.18' 'git')
optdepends=()
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://git.ontake.dev/go/leech")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

pkgver() {
	cd ${srcdir}/leech
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/leech"
	go mod tidy
	go build
}
	
package() {
	install -Dm755 "${srcdir}/leech/leech" "${pkgdir}"/usr/bin/leech
	install -Dm644 "${srcdir}/leech/pkg/config.json" "${pkgdir}"/etc/leech/config.json.example
	install -Dm644 "${srcdir}/leech/pkg/leech.service" "${pkgdir}"/usr/lib/systemd/system/leech.service
	install -Dm644 "${srcdir}/leech/pkg/sysusers.conf" "${pkgdir}"/usr/lib/sysusers.d/leech.conf
}
