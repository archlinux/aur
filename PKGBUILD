# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: awh

pkgname=pup-git
_gitname="pup"
_gourl="github.com/ericchiang/pup"
pkgver=0.4.0.r10.g681d7bb
pkgrel=1
epoch=1
pkgdesc="Parsing HTML at the command line"
arch=('any')
url="https://github.com/EricChiang/pup"
license=('MIT')
provides=('pup')
conflicts=('pup')
makedepends=('git' 'go')
source=('git+https://github.com/EricChiang/pup.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_gitname"
    go build -trimpath -ldflags "-extldflags $LDFLAGS" .
}

package() {
    cd "$_gitname"
    install -Dm755 "$srcdir/$_gitname/$_gitname" "$pkgdir/usr/bin/$_gitname"

    # Package license (if available)
    for f in LICENSE COPYING LICENSE.* COPYING.*; do
        if [ -e "$f" ]; then
            install -Dm644 "$f" \
                "$pkgdir/usr/share/licenses/$_gitname/$f"
        fi
    done
}
