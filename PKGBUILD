# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Abd El-Twab M. Fakhry <abdeltwab.m.fakhry@gmail.com>
pkgname=nxprayer
pkgver=v0.1.1
pkgrel=1
epoch=
pkgdesc="Time of the next Islamic prayer in your status bar."
arch=(x86_64 i686)
url="https://github.com/AbdeltwabMF/nxprayer.git"
license=('GPL-v3')
groups=()
depends=(jq gawk bash libnotify)
makedepends=(git make g++ python3)
checkdepends=()
optdepends=()
provides=(nxprayer)
conflicts=(nxprayer)
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
	cd "${pkgname}"
    printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd nxprayer
	make
}

package() {
    cd nxprayer
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
