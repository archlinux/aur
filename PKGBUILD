# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Benoit Favre <benoit.favre@lif.univ-mrs.fr>

pkgname=vamp-pyin-f0-plugin
pkgver=1.2
pkgrel=2
pkgdesc="Probabilistic YIN algorithm for fundamental frequency (F0) estimation in monophonic audio (vamp plugin)"
arch=(i686 x86_64)
url="https://code.soundsoftware.ac.uk/projects/pyin"
_url="https://gitlab.com/tallero/vamp-pyin-f0-plugin"
license=('GPL')
depends=(vamp-plugin-sdk)
#source=("http://code.soundsoftware.ac.uk/attachments/download/2627/pyin-v$pkgver.tar.gz")
source=("git+$_url")
md5sums=('SKIP') 

build() {
	cd $pkgname
	make -f Makefile.linux64 \
        	PLUGIN_LDFLAGS="-shared -lvamp-sdk -Wl,--version-script=vamp-plugin.map" pyin.so
}

package() {
	cd $pkgname
	install -Dm755 pyin.so "$pkgdir/usr/lib/vamp/vamp-pyin-f0.so"
}
