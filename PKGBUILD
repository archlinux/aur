# Maintainer: decipher3114 <decipher3114@gmail.com>
pkgname="capter"
pkgver=v2.2.2
pkgrel=1
pkgdesc="A simple cross-platform screenshot tool made in rust"
arch=("x86_64")
url="https://github.com/decipher3114/capter"
license=("Apache-2.0")
depends=(
    "git"
    "gtk3"
    "xdotool"
    "libayatana-appindicator"
    "libxcb"
    "libxrandr"
    "dbus"
)
makedepends=(
	"rust"
	"gtk3"
    "xdotool"
    "libayatana-appindicator"
    "libxcb"
    "libxrandr"
    "dbus"
)
source=(
    "git+https://github.com/decipher3114/capter"
)
noextract=()
md5sums=('SKIP')

pkgver() {  
	cd "${srcdir}/${pkgname}"
    git fetch --tags
    git describe --tags | sed 's/-.*//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git fetch --all --tags
}

build() {
    cd "${srcdir}/${pkgname}"
    git reset --hard "${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/icons"
    cp -R --update "assets/resources/linux/hicolor" "${pkgdir}/usr/share/icons"
    install -Dm644 "assets/resources/linux/capter.desktop" -t "${pkgdir}/usr/share/applications"
}
