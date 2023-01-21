# Maintainer: rern <rernrern@gmail.com>

pkgname=camillagui-backend
pkgver=1.0.0.rc5
pkgrel=1
pkgdesc='Backend server for camillagui'
url=https://github.com/HEnquist/camillagui-backend
arch=(any)
license=(GPL)
source=(https://github.com/HEnquist/camillagui-backend/archive/refs/tags/v${pkgver/.rc/-rc}.tar.gz
        camillagui.install
        camillagui.service
        camillagui.yml)
sha256sums=('dc2479998c8224077ba13be26e9ceca55b69731b12f14262c8e118c4d46ac23e'
            '5f06cf681acd54f704f1e7dd0173dbbe5a003d453746323930cdb611c0bd0f27'
            '816138c492d68e291375971a95f88e13d665a21e39202dfce7443c57b4d1d240'
            '15c0f36e5bebdfda8eb6d8cc5e34d8a6982a0b13eaf73f2d7478f48da1fe5587')
			
install=camillagui.install

build() {
    installdir=$srcdir/srv/http/settings/camillagui
    mkdir -p $installdir $installdir/build
    bsdtar xf v${pkgver/.rc/-rc}.tar.gz --strip=1 -C $installdir
    rm $installdir/{.gitignore,*.md,*.txt}
    rm -rf $installdir/{.github,build}
    cp -f camillagui.yml $installdir/config
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
