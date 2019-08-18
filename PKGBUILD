# Maintainer: Max Struebing <mxstrbng@gmail.com>

pkgname=editorconfig-checker-git
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool to verify that your files are in harmony with your .editorconfig"
arch=(any)
url="https://github.com/editorconfig-checker/editorconfig-checker"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=("git+$url")
md5sums=('SKIP')
provides=('ec' 'editorconfig-checker')

pkgver() {
    cd "$srcdir/editorconfig-checker" || exit
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
    cd "$srcdir/editorconfig-checker" 
    go get -u github.com/editorconfig-checker/editorconfig-checker
    make build
}

package() {
    cd "$srcdir/editorconfig-checker/bin" || exit
    install -Dm755 ec "$pkgdir/usr/bin/ec"
    install -Dm755 ec "$pkgdir/usr/bin/editorconfig-checker"
    cd "$srcdir/editorconfig-checker" || exit
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/editorconfig-checker/LICENSE"
}
