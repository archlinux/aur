# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scripthaus-git
pkgver=0.5.0.r5.gd8897c7
pkgrel=1
pkgdesc="ScriptHaus lets you run bash, Python, and JS snippets from your Markdown files directly from the command-line. It can turn any Markdown file (including your README.md or BUILD.md) into a command-line tool, complete with command-line help and documentation."
arch=('any')
url="https://www.scripthaus.dev/"
_ghurl="https://github.com/scripthaus-dev/scripthaus"
license=('MPL2')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    'electron27'
)
makedepends=(
    'go>=1.17'
    'git'
)
source=(
    "${pkgname%-git}"::"git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    cd "${srcdir}/${pkgname%-git}"
    export CGO_ENABLED=1
    go build -o scripthaus cmd/main.go
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}" -t "${pkgdir}/usr/bin"
}