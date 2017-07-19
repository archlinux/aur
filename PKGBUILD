# Maintainer: johnjq <dev [at] johnjq (dot) com>

pkgname=git-annex-remote-b2-git
pkgver=v0.3.r6.g2bf053c
pkgrel=2
pkgdesc="A git-annex special remote for Backblaze's B2"
arch=("x86_64" "i686")
url="https://github.com/encryptio/git-annex-remote-b2"
license=("MIT")
depends=("go")
optdepends=("git-annex" "git-annex-git")
options=("!strip" "!emptydirs")
source=("git+https://github.com/encryptio/git-annex-remote-b2")
sha512sums=("SKIP")
_go_backblaze_url=("gopkg.in/kothar/go-backblaze.v0")
_go_git_annex_external_url=("github.com/encryptio/go-git-annex-external/external")

pkgver() {
    cd "$srcdir/git-annex-remote-b2"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export GOPATH="$srcdir"
    go get -fix -v -x "${_go_git_annex_external_url}"
    go get -fix -v -x "${_go_backblaze_url}"
    (cd "$srcdir/git-annex-remote-b2" && go build)
}

package() {
    cd "$srcdir/git-annex-remote-b2"
    install -Dm755 "git-annex-remote-b2" "$pkgdir/usr/bin/git-annex-remote-b2"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
