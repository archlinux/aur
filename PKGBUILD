# Maintainer: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye
pkgver=0.40rc1
pkgrel=1
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
         'python2-pillow'
	 'mime-types')

makedepends=('python2-distribute' )
options=(emptydirs)
install=motioneye.install
backup=('etc/motioneye/motioneye.conf')
source=("https://github.com/ccrisan/motioneye/archive/$pkgver.tar.gz")
sha512sums=('bfa60c53eb971b43a9e9872ff847d17cb9161d29c66df2acc7dc87e0f42f7da71a4ad6395524caeeda8b96ce0c444254e1e8757905e5f464b59039f1c9100701')

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
