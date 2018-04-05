# Maintainer: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye
pkgver=0.39
pkgrel=2
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
         'python2-jinja'
         'python2-pycurl'
         'python2-pillow'
	 'mime-types')

makedepends=('python2-distribute' )
options=(emptydirs)
install=motioneye.install
backup=('etc/motioneye/motioneye.conf')
source=("https://github.com/ccrisan/motioneye/archive/$pkgver.tar.gz")
md5sums=('65a42e4b150aedfbab4b07408c83018f')

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
