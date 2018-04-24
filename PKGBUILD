
# Maintainer: Noel Kuntze <noel@familie-kuntze.de>
pkgname=docker-makepkg
pkgver=1.5
pkgrel=1
pkgdesc="A script and docker image to build packages in a clean container"
arch=(any)
url="https://github.com/Thermi/docker-makepkg"
license=('MIT')
depends=(docker)
source=("https://github.com/Thermi/docker-makepkg/archive/${pkgver}.tar.gz"
		"https://github.com/Thermi/docker-makepkg/releases/download/${pkgver}/${pkgver}.tar.gz.asc")
sha256sums=('c22a75186c21e88885c350955a6bf72764e0baa4f02a331cd0fb11391a66effe'
            'SKIP')
validpgpkeys=(92C65A2073E1D8A4D0985B7B509B7C4EBF451EDC)
install=docker_makepkg.install

package() {
	cd "$pkgdir"
	mkdir -p "$pkgdir/opt/docker-makepkg/bin" "$pkgdir/usr/lib/systemd/system" "$pkgdir/etc/profile.d"
	cp "$srcdir/$pkgname-$pkgver"/docker-makepkg-path.sh "$pkgdir/etc/profile.d/"
	cp "$srcdir/$pkgname-$pkgver"/{Dockerfile,buildme.sh,run.sh,sudoers} "$pkgdir/opt/docker-makepkg"
	cp "$srcdir/$pkgname-$pkgver"/bin/dmakepkg "$pkgdir/opt/docker-makepkg/bin/"
	cp "$srcdir/$pkgname-$pkgver"/docker-makepkg.{service,timer} "$pkgdir/usr/lib/systemd/system/"
}
