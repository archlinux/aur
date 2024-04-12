# Maintainer: merrkry <jeffpotvin930@gmail.com>

_pkgname="bypass4netns"
pkgname="${_pkgname}"
pkgver=0.4.1
pkgrel=1
pkgdesc="Accelerates slirp4netns using SECCOMP_IOCTL_NOTIF_ADDFD. As fast as --net=host."
arch=("x86_64")
url="https://github.com/rootless-containers/bypass4netns"
license=("Apache-2.0")
depends=("slirp4netns")
makedepends=("git" "go")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/rootless-containers/bypass4netns/archive/v$pkgver.tar.gz")
validpgpkeys=("49524C6F9F638F1A")
sha256sums=("60e8c4b0d4c67c374dc48273727ca3f6c0fe217b8abf1bbc5b426d529c568cb4")

build() {
    cd $_pkgname-$pkgver
    make
}

package() {
    cd $_pkgname-$pkgver
    install -Dm755 "bypass4netns" "$pkgdir/usr/bin/bypass4netns"
    install -Dm755 "bypass4netnsd" "$pkgdir/usr/bin/bypass4netnsd"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}