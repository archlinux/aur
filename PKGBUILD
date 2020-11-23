# Maintainer: Noel Kuntze <noel@familie-kuntze.de>
pkgname=docker-makepkg
pkgver=2.9.1
pkgrel=2
pkgdesc="A script and docker image to build packages in a clean container"
arch=(any)
url="https://github.com/Thermi/docker-makepkg"
license=('MIT')
depends=(iptables docker darkhttpd python python-netifaces python-ipaddress)
makedepends=()
source=("https://github.com/Thermi/docker-makepkg/releases/download/${pkgver}/docker-makepkg-${pkgver}.tar.gz"
		"https://github.com/Thermi/docker-makepkg/releases/download/${pkgver}/docker-makepkg-${pkgver}.tar.gz.asc")
sha256sums=('7e7f2108795521fd5725b4843ed410fa9394ef4362881201b2eadcba0f372bab'
            'SKIP')

validpgpkeys=(352493BEB5F78E631372AF2DF54EE40B0739AD6C)
install=docker_makepkg.install

package() {
	cd "$pkgdir"
	mkdir -p "$pkgdir/opt/docker-makepkg/bin" "$pkgdir/usr/lib/systemd/system" "$pkgdir/etc/profile.d"
	cp "$srcdir/$pkgname-$pkgver"/docker-makepkg-path.sh "$pkgdir/etc/profile.d/"
	cp "$srcdir/$pkgname-$pkgver"/{Dockerfile,containerBuilder.py,run.py,sudoers} "$pkgdir/opt/docker-makepkg"
	cp "$srcdir/$pkgname-$pkgver"/bin/dmakepkg.py "$pkgdir/opt/docker-makepkg/bin/"
	cp "$srcdir/$pkgname-$pkgver"/docker-makepkg.{service,timer} "$pkgdir/usr/lib/systemd/system/"
}
