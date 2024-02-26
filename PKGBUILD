# Maintainer: Siddhant Madhur <siddhant.madhur@gmail.com>
pkgname=straw
pkgver=v0.1.beta1
pkgrel=1
pkgdesc="CLI tool to easily go-to projects all over your desktop and open a new tmux session in it"
arch=(x86_64)
url="https://github.com/siddhantmadhur/straw"
license=(MIT)
makedepends=(git go)
provides=(straw)
source=("straw::git+https://github.com/siddhantmadhur/straw.git")
sha256sums=(SKIP)

pkgver () {
    cd straw
    git checkout release
    git describe --tags --abbrev=0
}


build() {
    cd straw
    git checkout release
    go build -ldflags="-X 'main.version=${pkgver}'" -o straw 
}

package() {
    cd straw
    git checkout release
    install -Dm755 straw -t "${pkgdir}/usr/bin" 
}
