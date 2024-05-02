# Maintainer: 1ridic <i at 8f dot al>
pkgname=easylpac-git
pkgver=r122.b61b1e8
pkgrel=1
pkgdesc="lpac GUI Frontend"
arch=('x86_64')
url="https://github.com/creamlike1024/EasyLPAC"
license=('MIT')
makedepends=('go')
depends=('lpac')
provides=("easylpac")
conflicts=("easylpac")
source=(
  git+https://github.com/creamlike1024/EasyLPAC.git
)
sha256sums=(
  "SKIP"
)

pkgver() {
	cd EasyLPAC
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd EasyLPAC
  sed -i "s/const Version = \"development\"/const Version = \"$VERSION\"/" main.go
  sed -i "s/const EUICCDataVersion = \"unknown\"/const EUICCDataVersion = \"$DATE\"/" main.go
  go generate
  go run fyne.io/fyne/v2/cmd/fyne@latest package --icon assets/icon128.png --release
  
}

package() {
  cd EasyLPAC
  tar xf EasyLPAC.tar.xz
  install -Dm644 usr/local/share/applications/EasyLPAC.desktop $pkgdir/usr/share/applications/EasyLPAC.desktop
  install -Dm755 usr/local/bin/EasyLPAC $pkgdir/usr/bin/EasyLPAC
  install -Dm644 usr/local/share/pixmaps/EasyLPAC.png $pkgdir/usr/share/pixmaps/EasyLPAC.png
}
