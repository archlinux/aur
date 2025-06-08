# Maintainer: Frédéric Logier <fredix@protonmail.com>
pkgname=gibson
pkgver=0.7.2
pkgrel=1
epoch=
pkgdesc="A simple markdown go blog"
arch=("any")
url="https://codeberg.org/fredix/gibson"
license=('GPL-3.0-or-later')
groups=()
depends=(go)
makedepends=()
checkdepends=()
optdepends=()
provides=(gibson)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

prepare() {
        cd "$pkgname"
        export GOPATH=/tmp/go
        export GOBIN=/tmp/go/bin
}

build() {
        cd "$pkgname"
        export GOPATH=/tmp/go
        export GOBIN=/tmp/go/bin
        export PATH=$GOBIN:$PATH
	pwd
        ./build.sh $pkgver
}

check() {
        cd "$pkgname"

}

package() {
        cd "$pkgname"
        install -Dm755 --no-target-directory "gibson" "${pkgdir}/usr/bin/${pkgname}"
        install -Dm755 "templates"/* -t "${pkgdir}/usr/share/gibson/templates/"
        install -Dm755 "markdown/pages"/* -t "${pkgdir}/usr/share/gibson/markdown/pages"
        install -Dm755 "markdown/textes"/* -t "${pkgdir}/usr/share/gibson/markdown/textes"
        install -Dm755 "markdown/posts"/* -t "${pkgdir}/usr/share/gibson/markdown/posts"
        install -Dm644 --no-target-directory "gibson.toml.example" "${pkgdir}/usr/share/gibson/gibson.toml"
        install -Dm644 --no-target-directory "Dockerfile" "${pkgdir}/usr/share/gibson/Dockerfile"
        cp -ar static "${pkgdir}/usr/share/gibson"
}
