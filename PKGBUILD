pkgname=starrypy
pkgver=1.6
pkgrel=1
pkgdesc="Plugin-driven Starbound proxy server built using Twisted."
arch=(any)
url="https://github.com/CarrotsAreMediocre/StarryPy"
license=("WTFPL")
install=starrypy.install
depends=(python2-twisted python2-sqlalchemy python2-enum34 python2-construct python2-tornado)
makedepends=(python2)
optdepends=("python2-nose: testsuite")
backup=("srv/starrypy/config/config.json.default")
source=("starrypy.zip::https://github.com/StarryPy/StarryPy/archive/b11e7444a0223bd86f9601f338950995e49e6ae0.zip"
"starrypy.sh")
md5sums=('bc55382d21484feaf2b5b60a1acac86c'
         '681dabb1214c046fd6f2db802eaf6a79')

package() {
	install -Dm755 "$srcdir/starrypy.sh" "$pkgdir/usr/bin/starrypy"
	cd StarryPy-*
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/starrypy/LICENSE"
	find . -name '*.json' -exec install -Dm644 {} "$pkgdir/srv/starrypy/"{} \;
	find . -name '*.py' -exec install -Dm644 {} "$pkgdir/srv/starrypy/"{} \;
	install -Dm644 config/config.json.default "$pkgdir/srv/starrypy/config/config.json.default"
	python2 -m compileall "$pkgdir"
} 
