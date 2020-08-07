# Maintainer: Jan Schmitt <arch@smittie.de>
pkgname=git-team-git
pkgver=1.4.0.r473.591916d
pkgrel=1
epoch=
pkgdesc="Command line interface for managing and enhancing git commit messages with co-authors."
arch=(x86_64)
url="https://github.com/hekmekk/git-team.git"
license=('MIT')
groups=()
depends=(go)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(git-team)
conflicts=(git-team)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver(){
    cd "${_pkgname}"
    printf "1.4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd git-team
    if [[ $GO_PATH != "" ]]; then
        GO_PATH=$HOME/go
    fi
    make
}

package() {
    cd git-team
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
