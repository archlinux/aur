# Maintainer: rern <rernrern@gmail.com>

pkgname=camillagui
pkgver=0.8.0
pkgrel=1
pkgdesc='Web-based GUI for CamillaDSP'
url=https://github.com/HEnquist/camillagui-backend
arch=(any)
license=(GPL)
#depends=(camilladsp python-aiohttp python-pycamilladsp python-pycamilladsp-plot)
install=camillagui.install
source=(https://github.com/HEnquist/camillagui-backend/releases/download/v$pkgver/camillagui.zip)
sha256sums=(6c70a8950a9dc3c8752efa77d60ec863035913d7775411034dd21c8b9a603bf3)

build() {
	installdir=$srcdir/srv/http/settings/camillagui
	mkdir -p $installdir
	unzip camillagui.zip -d $installdir
	rm $installdir/*.{md,txt}
	sed -i 's/"build")$/"build", follow_symlinks=True)/' $installdir/backend/routes.py
}

package() {
	mv $srcdir/srv $pkgdir
	install -d $pkgdir/$installdir
}
