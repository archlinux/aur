# Maintainer: Kiril Zyapkov <kiril.zyapkov@gmail.com>
_pkgbase=dsd
pkgname=$_pkgbase-git
pkgver=1.6.0.r91.gf175834
pkgrel=1
pkgdesc="Decoder for P25, ProVoice, X2-TDMA, DMR/MOTOTRBO, NXDN"
arch=('i686' 'x86_64')
url="https://github.com/szechyjs/dsd"
license=('custom:copyright')
depends=('mbelib' 'portaudio' 'itpp')
provides=('dsd')
conflicts=('dsd')
source=("$_pkgbase::git+https://github.com/szechyjs/dsd.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  # disable $HOME to prevent git to use user's configuration
  HOME=/dev/null git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgbase"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
    make
}

package() {
    cd "$srcdir/$_pkgbase/build"
    make DESTDIR="$pkgdir" install

    cd "$srcdir/$_pkgbase"
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
