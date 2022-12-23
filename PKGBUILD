pkgname=pfsshell-git
pkgver=101.05da6d0
pkgrel=1
pkgdesc="Browse and edit PFS filesystems."
arch=("i686" "x86_64")
url="https://github.com/ps2homebrew/pfsshell"
license=('GPL-2.0')
makedepends=('meson')
source=('pfsshell-git::git+https://github.com/ps2homebrew/pfsshell.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    meson setup builddir
    cd builddir
    meson compile
}

package() {
    cd "$srcdir/${pkgname}/builddir"
    install -Dm755 pfsshell "$pkgdir/usr/bin/pfsshell"
}
