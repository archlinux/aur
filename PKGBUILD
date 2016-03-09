# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Alexander R?dseth <rodseth@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=chuck-pulse
pkgver=1.3.5.2
pkgrel=1
pkgdesc='Concurrent, on-the-fly audio programming language'
arch=('x86_64' 'i686')
url='http://chuck.cs.princeton.edu/'
license=('GPL')
depends=('gcc-libs' 'libsndfile')
conflicts=('chuck')
provides=('chuck')
source=("http://chuck.cs.princeton.edu/release/files/chuck-$pkgver.tgz")
sha256sums=('e900b8545ffcb69c6d49354b18c43a9f9b8f789d3ae822f34b408eaee8d3e70b')

build() {
    patch -p0 --binary -i "$startdir/pulse.patch"
    make -C "chuck-$pkgver/src" linux-alsa
}

package() {
    cd "chuck-$pkgver/src"

    install -Dm755 "chuck" "$pkgdir/usr/bin/chuck"
    install -d "$pkgdir/usr/share/doc/chuck"
    cp -r ../examples "$pkgdir/usr/share/doc/chuck"
}
