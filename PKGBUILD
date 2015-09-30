# Maintainer: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye
pkgver=0.27.2
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
         'python2-jinja'
         'python2-pycurl'
         'python2-pillow')

makedepends=('python2-distribute' )
options=(emptydirs)
install=motioneye.install
backup=('etc/motioneye/motioneye.conf')
source=('https://pypi.python.org/packages/source/m/motioneye/motioneye-0.27.2-2.tar.gz')
md5sums=('015280fa895481b5761efd9fe32766d4')

build() {
    cd $srcdir/motioneye-0.27.2
    python2 setup.py build
}


package() {
	mkdir -p $pkgdir/etc/motioneye
	mkdir -p $pkgdir/var/lib/motioneye


	cp $srcdir/motioneye-$pkgver/extra/motioneye.conf.sample $pkgdir/etc/motioneye/motioneye.conf
	install -Dm644 "$srcdir/motioneye-$pkgver/extra/motioneye.systemd-unit" $pkgdir/usr/lib/systemd/system/motioneye.service

	cd $srcdir/motioneye-0.27.2
    	python2 setup.py install --root="$pkgdir" --optimize=1 
}
