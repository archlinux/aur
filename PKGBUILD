# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>
# Contributor: Arne Brücher <archlinux[at]arne-bruecher[dot]de>

pkgname=amdfand-bin
pkgver=1.0.14
pkgrel=2
pkgdesc="AMDGPU fan speed management tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "$url/releases/download/v1.0.12/amdfand-archlinux-latest-$pkgver.zip")
arch=('x86_64')
conflicts=('amdfand' 'amdfand-git')
provides=('amdfand')
md5sums=('1a30e5ee9a3526f25c3b8b04141cb55c')
makedepends=('unzip')
optdepends=('amdmond-bin' 'amdguid-glow-bin' 'amdguid-wayland-bin' 'amdvold-bin')

build() {
    cd $srcdir/
    unzip -v $srcdir/amdfand-archlinux-latest-$pkgver.zip
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install -m 0755 $srcdir/target/release/amdfand $pkgdir/usr/bin
    install -m 0644 $srcdir/services/amdfand.service "$pkgdir/usr/lib/systemd/system/amdfand.service"
}
