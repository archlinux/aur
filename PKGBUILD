# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=tui-datepicker-git
_gitname=${pkgname%-git}
pkgdesc="select date in terminal with vim-motions and copy to buffer"
pkgver=20250102.3b85c3a
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/maraloon/tui-datepicker"
license=("unknown")
makedepends=("go")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd ${_gitname}
    printf "%s.%s" "$(git show -s --format=%cs | tr -d -)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}
    go build -trimpath -ldflags "-s -w"
}

package() {
    install -Dm755 ${srcdir}/${_gitname}/${_gitname} ${pkgdir}/usr/bin/${_gitname}
}
