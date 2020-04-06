# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Maintainer: Uzerus < szymonscholz at gmail.com >
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Augusto F. Hack <hack.augusto@gmail.com>

pkgname=diamond
pkgver=4.0.515
pkgrel=4
pkgdesc="Daemon that collects system metrics and publishes 
them to graphite and others"
arch=('any')
url="https://github.com/python-diamond/Diamond"
license=('mit')
depends=('python2' 'python')
makedepends=('python2')
optdepends=('python2-psycopg2: Postgresql collector'
            'python2-pysensors: LMSensors collector'
	    'libvirt-python: LibvirtKVM collector'
	    'python2-yaml: PuppetAgent collector')
backup=(etc/diamond/diamond.conf)
source=("https://pypi.python.org/packages/0c/b6/4c58a8a1111c138fbed9e65dd918be706af8abd07bb5e8fe3ddfb453d899/${pkgname}-${pkgver}.tar.gz"
	"https://archive.org/download/${pkgname}_201801/${pkgname}.service")
md5sums=('9ef6c5203e098da10aa0d90b344a49da'
         '4294f34a8a4644c28788b997dcb4ba22')


package() {
	cd "$srcdir/diamond-${pkgver}"

	install -D -m644 "$srcdir/diamond.service" "$pkgdir/usr/lib/systemd/system/diamond.service"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	rm "$pkgdir/etc/diamond/diamond.conf.example.windows"
	rm -rf "$pkgdir/etc/diamond/collectors"
	rm -rf "$pkgdir/etc/diamond/handlers"
	rm -rf "$pkgdir/usr/share/diamond/user_scripts"
	mv "$pkgdir/etc/diamond/diamond.conf.example" "$pkgdir/etc/diamond/diamond.conf"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}