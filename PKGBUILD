# Maintainer: Wojciech M. Wnuk <laniusone@pm.me>

_pkgbase="icloud-for-linux"
pkgname="$_pkgbase-git"
pkgver=r38.66d3cd9
pkgrel=1
pkgdesc="iCloud for Linux"
arch=("x86_64")
url="https://github.com/wmwnuk/icloud-for-linux"
license=("GPL")
depends=('npm' 'nss')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
backup=()
source=("git+https://github.com/wmwnuk/icloud-for-linux")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgbase
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd icloud-for-linux
    npm install electron electron-packager
    npx electron-packager . --overwrite --platform=linux --output=release-build --prune=true
}

package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/lib/icloud-for-linux
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/256x256/apps
    cp icloud-for-linux/desktop/* "$pkgdir"/usr/share/applications
    cp icloud-for-linux/icons/* "$pkgdir"/usr/share/icons/hicolor/256x256/apps
    cp -r icloud-for-linux/icloud-for-linux-linux-x64/* "$pkgdir"/usr/lib/icloud-for-linux/
    ln -s /usr/lib/icloud-for-linux/icloud-for-linux "$pkgdir"/usr/bin/
}
