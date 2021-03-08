# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ederson Ferreira <edersondeveloper@gmail.com>
pkgname=modhammer-edersonferreira-git
pkgver=1.1.r1.def8648
pkgrel=1
epoch=
pkgdesc="A Twitch's Mod tool to do actions in a list of channels"
arch=(x86_64 i686)
url="https://github.com/edersonferreira/modhammer"
license=('MIT')
groups=()
depends=()
makedepends=(git go)
checkdepends=()
optdepends=()
provides=(modhammer)
conflicts=(modhammer)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd modhammer
	go build main.go
  sudo mv main /usr/bin/modhammer
}

package() {
    cd modhammer
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    go build main.go
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
