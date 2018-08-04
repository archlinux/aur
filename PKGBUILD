# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Matt Parnell /ilikenwf <parwok@gmail.com>
# Contributor: Jonathan <eyeswide@gmail.com>

pkgname=libpciaccess-git
pkgver=0.14.r0.g13854f6
pkgrel=1
pkgdesc='X11 PCI access library (git version)'
arch=('i686' 'x86_64')
url='http://cgit.freedesktop.org/xorg/lib/libpciaccess/'
license=('custom')
depends=('glibc')
makedepends=('git' 'xorg-util-macros')
provides=('libpciaccess')
conflicts=('libpciaccess')
source=("$pkgname"::'git://anongit.freedesktop.org/xorg/lib/libpciaccess')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libpciaccess\.//;s/^v//'
}

build() {
    cd "$pkgname"
    
    ./autogen.sh \
        --prefix='/usr' \
        --sysconfdir='/etc'
    
    make
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
