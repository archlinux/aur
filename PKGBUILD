pkgname=pfsfuse-git
pkgver=101.05da6d0
pkgrel=1
pkgdesc="Mount PFS filesystems with fuse."
arch=("i686" "x86_64")
url="https://github.com/ps2homebrew/pfsshell"
license=('GPL-2.0')
makedepends=('meson' 'fuse2')
source=('pfsfuse-git::git+https://github.com/ps2homebrew/pfsshell.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    meson setup builddir
    cd builddir
    meson configure -Denable_pfsfuse=true
    meson compile
}

package() {
    cd "$srcdir/${pkgname}/builddir"
    install -Dm755 pfsfuse "$pkgdir/usr/bin/pfsfuse"
}
