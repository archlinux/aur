# Maintainer: rern <rernrern@gmail.com>

pkgname=camillagui
pkgver=0.8.0
pkgrel=1
pkgdesc='Web-based GUI for CamillaDSP'
url=https://github.com/HEnquist/camillagui-backend
arch=(any)
license=(GPL)
makedepends=(unzip)
install=camillagui.install
source=(https://github.com/HEnquist/camillagui-backend/releases/download/v$pkgver/camillagui.zip
        camillagui.service)
sha256sums=(6c70a8950a9dc3c8752efa77d60ec863035913d7775411034dd21c8b9a603bf3
            816138c492d68e291375971a95f88e13d665a21e39202dfce7443c57b4d1d240)

build() {
    installdir=$srcdir/srv/http/settings/camillagui
    mkdir -p $installdir
    unzip camillagui.zip -d $installdir
    rm $installdir/*.{md,txt}
    sed -i 's/"build")$/"build", follow_symlinks=True)/' $installdir/backend/routes.py
}

package() {
    depends=(camilladsp
             python-aiohttp
             python-jsonschema
             python-matplotlib
             python-numpy
             python-pycamilladsp
             python-pycamilladsp-plot
             python-websocket-client
             python-websockets
             python-yaml)
    mv $srcdir/srv $pkgdir
    install -d $pkgdir/$installdir
    install -Dm 644 camillagui.service -t $pkgdir/usr/lib/systemd/system
}
