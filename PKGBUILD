# Maintainer: johnjq <dev [at] johnjq (dot) com>

pkgname=go-megaannex-git
pkgver=0
pkgrel=2
pkgdesc="A git-annex special remote using mega"
arch=("x86_64" "i686")
url="https://github.com/dxtr/megaannex-go"
license=("MIT")
depends=("go")
optdepends=("git-annex" "git-annex-git")
options=("!strip" "!emptydirs")
source=("git+https://github.com/dxtr/megaannex-go")
sha512sums=("SKIP")
_go_mega_url=("github.com/t3rm1n4l/go-mega")

#pkgver() {
    #cd "$srcdir/megaannex-go"
    #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
    export GOPATH="$srcdir"
    go get -fix -v -x "${_go_mega_url}"
    (cd "$srcdir/megaannex-go" && go build)
}

package() {
    cd "$srcdir/megaannex-go"
    install -Dm755 "megaannex-go" "$pkgdir/usr/bin/git-annex-remote-mega"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
