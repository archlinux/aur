# Maintainer: Jan Schmitt <arch@smittie.de>
_pkgname=git-team
pkgname=git-team-git
pkgver=1.4.1.r3.g60d6116
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
source=("$_pkgname"::"git+$url#branch=master")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver(){
    cd "${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    }

build() {
    cd "${_pkgname}"
    if [[ "$GOPATH" == "" ]]; then
        GOPATH="$HOME/go" make --jobs=1
    else
        make --jobs=1
    fi
}

package() {
    cd "${_pkgname}"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
	sudo make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
