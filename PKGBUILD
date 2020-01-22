# Maintainer: desbma
pkgname=bat-extras-git
pkgver=v20190117.r8.g765658c
pkgrel=1
pkgdesc='Bash scripts that integrate bat with various command line tools'
arch=('any')
_gitname='bat-extras'
url="https://github.com/eth-p/${_gitname}"
license=('MIT')
depends=('bat')
makedepends=('git')
optdepends=('ripgrep: for batgrep script')
source=("git+https://github.com/eth-p/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    ./build.sh --minify=none --no-verify
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/*
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
