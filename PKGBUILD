# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Matt Parnell /ilikenwf <parwok@gmail.com>
# Contributor: Jonathan <eyeswide@gmail.com>

pkgname=libpciaccess-git
_srcname=libpciaccess
pkgver=0.14.r1.g44f3dd0
pkgrel=1
pkgdesc='X11 PCI access library (git version)'
arch=('i686' 'x86_64')
url='https://cgit.freedesktop.org/xorg/lib/libpciaccess/'
license=('custom')
depends=('glibc')
makedepends=('git' 'xorg-util-macros')
provides=('libpciaccess')
conflicts=('libpciaccess')
source=('git+https://anongit.freedesktop.org/git/xorg/lib/libpciaccess.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    autoreconf -fiv
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libpciaccess\.//;s/^v//'
}

build() {
    cd "$_srcname"
    
    ./configure --prefix='/usr' --sysconfdir='/etc'
    
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
