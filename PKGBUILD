# Maintainer: Louis Dalibard <ontake@ontake.dev>
# Contributor: Louis Dalibard <ontake@ontake.dev>
_pkgbase="ontake-hayai"
pkgname="$_pkgbase-git"
pkgver=r9.ga15715a
pkgrel=2
pkgdesc="An EEW system for Linux using JMA data provided by the Wolfx Project."
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/make-42/hayai"
license=('GPL3')
groups=()
depends=('gtk3' 'alsa-lib')
makedepends=('go>=1.18' 'git')
optdepends=()
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/make-42/hayai")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

pkgver() {
	cd ${srcdir}/hayai
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/hayai"
	go mod tidy
	go build
}
	
package() {
	install -Dm755 "${srcdir}/hayai/hayai" "${pkgdir}"/usr/bin/hayai
}
