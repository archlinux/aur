# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=vamp-pyin-f0-plugin
pkgver=1.0
pkgrel=1
pkgdesc="Probabilistic YIN algorithm for fundamental frequency (F0) estimation in monophonic audio (vamp plugin)"
arch=(i686 x86_64)
url="https://code.soundsoftware.ac.uk/projects/pyin"
license=('GPL')
depends=(vamp-plugin-sdk)
source=(https://code.soundsoftware.ac.uk/attachments/download/884/pyin-v$pkgver.tar.gz)
md5sums=(c16bb500796614983dac8c2f7346ddc2) 

build() {
	cd "$srcdir/pyin-v$pkgver"
    make -f Makefile.linux64 PLUGIN_LDFLAGS="-shared -lvamp-sdk -Wl,--version-script=vamp-plugin.map" pyin.so
}

package() {
	cd "$srcdir/pyin-v$pkgver"
    install -Dm755 pyin.so "$pkgdir/usr/lib/vamp/vamp-pyin-f0.so"
}
