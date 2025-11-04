_pkgname="steamvr-lighthouse-manager"
pkgname="$_pkgname-git"
pkgrel=1
pkgver=1.1.main.r6.g173d2b9
epoch=
pkgdesc="App for managing SteamVR Base Stations 2.0."
arch=("x86_64")
url="https://github.com/DHCPCD9/go-steamvr-lighthouse-manager"
license=('GPLv3')
groups=()
depends=("go>=1.25.3" "git" "npm" "yarn" "gtk3>=2.50.1-1" "webkit2gtk" "gcc")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/DHCPCD9/go-steamvr-lighthouse-manager.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd "$pkgname"
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
}

build() {
	cd "$pkgname"
    wails build
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" "build/bin/base-station-manager"
    install -Dm644 -t "$pkgdir/usr/share/applications/$_pkgname.desktop" "resources/go-steamvr-lighthouse-manager.desktop"
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" "$_pkgname.png"
}