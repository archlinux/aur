pkgname=shuttle
pkgver=1.0.r.
pkgrel=1
epoch=
pkgdesc="My Work In progress antivirus"
arch=(x86_64 i686)
url="https://github.com/kavulox/shuttle.git"
license=('AGPL3')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
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
    printf "1.0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd shuttle
    make 
}

package() { 
    cd "${pkgname}"
    ls -ahl --color=auto
    pwd
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
