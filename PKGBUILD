# Maintainer: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye
pkgver=0.42.1
pkgrel=2
pkgdesc="web-based user interface for motion"
arch=(any)
url="https://github.com/ccrisan/motioneye/"
license=('GPL')
depends=('motion>3' 
         'ffmpeg' 
         'v4l-utils' 
         'python2' 
         'openssl' 
         'curl' 
         'python2-tornado'
	 'python2-futures'
         'python2-jinja'
         'python2-pycurl'
	 'python2-pytz'	
         'python2-pillow'
	 'mime-types')

makedepends=('python2-distribute' )
options=(emptydirs)
install=motioneye.install
backup=('etc/motioneye/motioneye.conf')
source=("https://github.com/ccrisan/motioneye/archive/$pkgver.tar.gz")
sha512sums=('462e24b520d17578a0ba69fac704ef8ed9d65b8b5b21f00ebd4796e4a7eb1f25dd365b80c4efb81c6f03b3c2f9b33a7158104126869e3f3fca65c916fe764102')

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
