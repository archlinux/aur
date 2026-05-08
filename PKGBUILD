# Maintainer: Mykhailo Aleksieiev <nekohepott@larpdhq.org>
pkgname=gogofetch-git
pkgver=r90.4be88c0
pkgrel=1
pkgdesc="Fetch written in Go with image support"
arch=('x86_64')
url="https://codeberg.org/nekohepott/goGoFetch.git"
license=('MIT')
depends=('glibc' 'chafa')
makedepends=('git' 'go')
checkdepends=()
optdepends=()
provides=("gogofetch")
conflicts=("gogofetch")
source=("git+https://codeberg.org/nekohepott/goGoFetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "goGoFetch"
  # мелви я твой рот ебал ты ж сто проц увидишь что я навайбкодил пкгбилд потом начнёшь клеветать меня в чате💀💀💀
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "goGoFetch"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "goGoFetch"
	go build -o "gogofetch" ./src
}

package() {
    cd "$srcdir/goGoFetch"

    install -Dm755 "gogofetch" "$pkgdir/usr/bin/gogofetch"

    install -d "$pkgdir/usr/share/gogofetch/logos"

    cp -v logos/*.png "$pkgdir/usr/share/gogofetch/logos/"

    chmod 755 "$pkgdir/usr/share/gogofetch/logos"
    chmod 644 "$pkgdir/usr/share/gogofetch/logos/"*.png
}

post_upgrade() {
    echo "! It is recommended to run 'gogofetch --reset-config' after upgrading gogofetch-git to get the latest config."
}
