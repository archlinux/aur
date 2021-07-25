# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Tom van der Lee <t0m.vd.l33@gmail.com>

pkgname=acts
pkgver=1.4.2
pkgrel=1
pkgdesc='A minimal shell script that creates backups with tarsnap'
arch=('any')
url='https://github.com/alexjurkiewicz/acts'
license=('Unlicense')
depends=('tarsnap' 'coreutils' 'util-linux')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b0c3f4a02eb290bbf4fd7724daf81ed05f3d051a35da0f76a0761911811c19f9')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/ExecStart/s|local/||' contrib/systemd/acts.service
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 acts -t "$pkgdir/usr/bin/"
	install -Dm 644 acts.conf.sample -t "$pkgdir/usr/share/$pkgname/"
	install -Dm 644 contrib/systemd/acts.{service,timer} -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
