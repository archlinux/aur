# Maintainer: Noel Kuntze <noel@familie-kuntze.de>
pkgname=docker-makepkg
pkgver=2.5
pkgrel=1
pkgdesc="A script and docker image to build packages in a clean container"
arch=(any)
url="https://github.com/Thermi/docker-makepkg"
license=('MIT')
depends=(iptables docker darkhttpd python python-netifaces python-ipaddress)
makedepends=()
source=("https://github.com/Thermi/docker-makepkg/releases/download/${pkgver}/docker-makepkg-${pkgver}.tar.gz"
		"https://github.com/Thermi/docker-makepkg/releases/download/${pkgver}/docker-makepkg-${pkgver}.tar.gz.asc")
sha256sums=('dcaacd767ce27035f21447bef8b736a8b3a7d6b179b733c15f09d4f95ceffbb4'
            'SKIP')

validpgpkeys=(92C65A2073E1D8A4D0985B7B509B7C4EBF451EDC)
install=docker_makepkg.install

package() {
	cd "$pkgdir"
	mkdir -p "$pkgdir/opt/docker-makepkg/bin" "$pkgdir/usr/lib/systemd/system" "$pkgdir/etc/profile.d"
	cp "$srcdir/$pkgname-$pkgver"/docker-makepkg-path.sh "$pkgdir/etc/profile.d/"
	cp "$srcdir/$pkgname-$pkgver"/{Dockerfile,containerBuilder.py,run.py,sudoers} "$pkgdir/opt/docker-makepkg"
	cp "$srcdir/$pkgname-$pkgver"/bin/dmakepkg.py "$pkgdir/opt/docker-makepkg/bin/"
	cp "$srcdir/$pkgname-$pkgver"/docker-makepkg.{service,timer} "$pkgdir/usr/lib/systemd/system/"
}
