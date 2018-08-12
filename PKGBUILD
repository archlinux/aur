# Maintainer: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye
pkgver=0.39.3
pkgrel=1
pkgdesc="web-based user interface for motion"
arch=(any)
url="https://github.com/ccrisan/motioneye/"
license=('GPL')
depends=('motion' 
         'ffmpeg' 
         'v4l-utils' 
         'python2' 
         'openssl' 
         'curl' 
         'python2-tornado'
	 'python2-futures'
         'python2-jinja'
         'python2-pycurl'
         'python2-pillow'
	 'mime-types')

makedepends=('python2-distribute' )
options=(emptydirs)
install=motioneye.install
backup=('etc/motioneye/motioneye.conf')
source=("https://github.com/ccrisan/motioneye/archive/$pkgver.tar.gz")
sha512sums=('8aa1104668d8a3b26ab22f9aaa7abc1e504e03852197a9d03f2e641043a269fc67e58d42589900208bf1748b848ca152db16faaaf36df30cfb2699c8f0bb6982')


build() {
    cd $srcdir/motioneye-$pkgver
    python2 setup.py build
}


package() {
	mkdir -p $pkgdir/opt/motioneye
	mkdir -p $pkgdir/etc/motioneye
	mkdir -p $pkgdir/var/lib/motioneye

	cp $srcdir/motioneye-$pkgver/extra/motioneye.conf.sample $pkgdir/etc/motioneye/motioneye.conf
	install -Dm644 "$srcdir/motioneye-$pkgver/extra/motioneye.systemd-unit" $pkgdir/usr/lib/systemd/system/motioneye.service

	cd $srcdir/motioneye-$pkgver
    	python2 setup.py install --root="$pkgdir" --optimize=1 
}
