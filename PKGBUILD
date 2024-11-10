# Maintainer: Popolon <popolon@popoplon.org>

_pkgname=meg4
pkgname=meg4-git
pkgver=r104.a299272
pkgrel=1
pkgdesc='Very performant fantasy console with lots of features and multiple languages'
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://github.com/relector-tuxnix/meg4'
license=('GPLv3')
depends=('sdl2')
makedepends=('git')
source=("git+https://github.com/relector-tuxnix/meg4")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}/platform/sdl/
    make
}
package() {
    cd ${_pkgname}/
    install -Dm755 platform/sdl/meg4 ${pkgdir}/usr/bin/meg4
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
