# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Alexander R?dseth <rodseth@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=chuck-pulse
pkgver=1.5.2.0
pkgrel=1
pkgdesc='Concurrent, on-the-fly audio programming language'
arch=('x86_64' 'i686')
url='http://chuck.cs.princeton.edu/'
license=('GPL')
depends=('gcc-libs' 'libsndfile')
conflicts=('chuck')
provides=('chuck')
source=("http://chuck.cs.princeton.edu/release/files/chuck-$pkgver.tgz")
sha256sums=('04d846f776752ff0d4dfd3c2e208c90226559de2ae24960ed30a456e67264f27')

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
