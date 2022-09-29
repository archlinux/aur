# Maintainer: alzpmq <kodatemitsuru@outlook.com>
# Contributor: lisuke <1657787678@qq.com>
pkgname=xx-net-git
pkgver=4.10.0.r1.g6c1f94f1
pkgrel=1
pkgdesc="XX-Net, a web proxy tool.(development version)"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/XX-net/XX-Net"
license=('unknown')
depends=('python' 'python-pycryptodome')
options=('!strip')

optdepends=('miredo: a Teredo server/client, x86_64' 
	    'miredo-debian: a Teredo client, armv7')
makedepends=('git')
conflicts=('xx-net')
install=$pkgname.install
source=(
	"xx-net-git::git+https://github.com/XX-net/XX-Net/"
	"xx-net.service"
		)
noextract=()
md5sums=(
	'SKIP'
	'9911696fa6f035c8cb4e1c10359c6682'
		)
validpgpkeys=()
pkgver() {
  cd "$srcdir/$pkgname"
  ( git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  )
}
package() {

	mkdir -p $pkgdir/opt/XX-net/
	cp -r ${srcdir}/$pkgname/* $pkgdir/opt/XX-net/

	mkdir -p $pkgdir/usr/bin/
	ln -s /opt/XX-net/xx_net.sh $pkgdir/usr/bin/xx_net

	install -D -m644 ${srcdir}/xx-net.service $pkgdir/usr/lib/systemd/system/xx-net.service
}
