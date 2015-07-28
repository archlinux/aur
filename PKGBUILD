# Maintainer: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye
pkgver=0.25.1
pkgrel=1
pkgdesc="web-based user interface for motion"
arch=(any)
url="https://bitbucket.org/ccrisan/motioneye"
license=('GPL')
depends=('motion' 
         'ffmpeg' 
         'v4l-utils' 
         'python2' 
         'python2-pip' 
         'openssl' 
         'curl' 
         'python2-tornado'
         'python2-jinja'
         'python2-pycurl'
         'python2-pillow')

options=(emptydirs)
install=motioneye.install
backup=('opt/motioneye/settings.py')
source=(https://bitbucket.org/ccrisan/motioneye/get/$pkgver.tar.gz
        motioneye.service)

md5sums=('d0312756cc0bd2c263aa438aa14b11e4'
         '63ac2ce77f638d8ade8afa80179b8b9c')

prepare() {
	sed 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -i $srcdir/ccrisan-motioneye-*/*.py
}

package() {
	motiondir=$pkgdir/opt/motioneye

	mkdir -p $motiondir
	cp -r $srcdir/ccrisan-motioneye-*/* $motiondir

	cp $motiondir/settings_default.py $motiondir/settings.py

	install -Dm644 "$srcdir/motioneye.service" "$pkgdir/usr/lib/systemd/system/motioneye.service"
}
