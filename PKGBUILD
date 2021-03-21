# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ederson Ferreira <edersondeveloper@gmail.com>
pkgname=terminaleco-edersonferreira-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A simple and fast Golang terminal"
arch=(x86_64 i686)
url="https://github.com/edersonferreira/terminaleco"
license=('MIT')
groups=()
depends=()
makedepends=(git go gtk3)
checkdepends=()
optdepends=()
provides=(terminaleco)
conflicts=(terminaleco)
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
	cd terminaleco
	go build main.go
  sudo mv main /usr/bin/terminaleco
}

package() {
    cd terminaleco
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    go build main.go
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
