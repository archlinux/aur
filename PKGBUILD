# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=linuxbrew-git
pkgver=r9886.5464673
pkgrel=1
pkgdesc="A fork of Homebrew for Linux: master branch"
arch=("x86_64")
url="http://brew.sh/linuxbrew/"
license=('Simplified BSD')
groups=()
depends=("ruby>=1.8.6"
         "gcc>=4.2")
makedepends=("git")
optdepends=()
provides=()
conflicts=("linuxbrew")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/Linuxbrew/brew.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    mkdir -p "$pkgdir/opt"
    cp -r "$pkgname" "$pkgdir/opt/linuxbrew"
    rm -rf "$pkgdir/opt/linuxbrew/.git"

    mkdir -p "$pkgdir/usr/local/bin"
    ln -s "/opt/linuxbrew/bin/brew" "$pkgdir/usr/local/bin/brew"

    mkdir -p "$pkgdir/usr/local/share/man/man1/"
    ln -s "/opt/linuxbrew/share/man/man1/brew.1" "$pkgdir/usr/local/share/man/man1/brew.1"

    mkdir -p "$pkgdir/usr/local/share/doc/"
    ln -s "/opt/linuxbrew/share/doc/homebrew/" "$pkgdir/usr/local/share/doc/homebrew"

}

# vim: set ts=8 sw=4 tw=0 et :
