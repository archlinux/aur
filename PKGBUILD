# Maintainer: Jacob Thomas Eerrington <archlinux@mail.jerrington.me>
pkgname=haskell-tpb-git
pkgver=0.1.1.0.r3.0904ce7
pkgrel=1
pkgdesc="Command-line tools for interacting with the Pushbullet API"
arch=('x86_64')
url="https://github.com/tsani/tpb"
license=('GPL')
groups=()
depends=('ghc')
makedepends=('git' 'cabal-install') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('haskell-tpb::git+https://github.com/tsani/tpb#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | cut -c2- | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cabal update
    cabal new-configure
    cabal new-build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin"
    install -t "$pkgdir/usr/bin" dist-newstyle/build/*/build/{pb-notify/pb-notify,tpb/tpb}
    install -t "$pkgdir/usr/bin" scripts/sms
}
