# Author: rr- <rr-@sakuya.pl>
# Maintainer: rr- <rr-@sakuya.pl>
pkgname=shot-git
pkgver=2.1
pkgrel=1
pkgdesc='A minimal screenshot tool aiming to provide good control over screenshot region.'
arch=('any')
url='https://github.com/rr-/shot'
license=('GPL')
depends=('git' 'gcc' 'xorg-xrandr' 'python' 'wget')
source=("$pkgname::git://github.com/rr-/shot.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0
}

build() {
    cd "$pkgname"
    ./bootstrap
    ./waf configure
    ./waf
}

package() {
    cd "$pkgname"
    install -Dm755 build/shot "$pkgdir/usr/bin/shot"
    install -Dm644 docs/shot.1 "$pkgdir/usr/share/man/man1/shot.1p"
}
