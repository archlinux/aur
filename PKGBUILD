pkgname=linuxbrew-git
pkgver=r13378.9e37f8101
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
    rm -r "$srcdir/$pkgname/.git"

    install -d "$pkgdir/opt/linuxbrew"
    cp -a "$srcdir/$pkgname/." "$pkgdir/opt/linuxbrew"

    install -d "$pkgdir/usr/local/bin"
    ln -sf "/opt/linuxbrew/bin/brew" "$pkgdir/usr/local/bin/brew"

    install -d "$pkgdir/usr/local/share/man/man1"
    ln -sf "/opt/linuxbrew/manpages/brew.1" "$pkgdir/usr/local/share/man/man1/brew.1"
}

# vim: set ts=8 sw=4 tw=0 et :
