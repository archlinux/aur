# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ivan Stoychev <IYStoychev21@codingburgas.bg>
pkgname=moonlight-git
pkgver=0.1.r18.8901687
pkgrel=1
epoch=
pkgdesc="Moonlight is a simple dotfiles management tool written in golang"
arch=(x86_64 i686)
url="https://github.com/IYStoychev21/Moonlight"
license=('MIT')
groups=()
depends=(go)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(moonlight)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd Moonlight
    go build -o build/moonlight cmd/moonlight/main.go
}

package() {
    cd Moonlight
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    sudo cp build/moonlight /usr/bin
}
