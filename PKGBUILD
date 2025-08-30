# Maintainer: Ben Mezger <me at benmezger dot nl>
_pkgname=gitmux
pkgname=$_pkgname-git
pkgver=r87.2e9ceb1
pkgrel=1
pkgdesc="Git in your tmux status bar"
arch=('x86_64' 'i686' 'aarch64')
Url="https://github.com/arl/gitmux"
license=('MIT')
depends=('tmux')
makedepends=('git' 'go')
source=('git+https://github.com/arl/gitmux.git')
md5sums=('SKIP')
provides=('gitmux-git')
conflicts=('gitmux')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname}"
        go build
        install -D -m755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
