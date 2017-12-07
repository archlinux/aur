# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname='csdr'
pkgver='0.15'
pkgrel='1'
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64')
url='https://github.com/simonyiszk/csdr'
license=('GPL')
depends=('fftw')
makedepends=('python2')
optdepends=('rtl-sdr: csdr-fm script' 'mplayer: csdr-fm script' 'python2: csdr-fm script')
source=("https://github.com/simonyiszk/csdr/archive/$pkgver.tar.gz")
sha256sums=('5273633dac6e7ed8d4abdbd8c5a9c466a3924e5853b18723701935067cdaa00b')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s/python/python2/g" csdr-fm
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 libcsdr.so ${pkgdir}/usr/lib/libcsdr.so
    install -Dm 0755 csdr ${pkgdir}/usr/bin/csdr
    install -Dm 0755 csdr-fm ${pkgdir}/usr/bin/csdr-fm
    install -Dm 0755 nmux ${pkgdir}/usr/bin/nmux
}
