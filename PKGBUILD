# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Useful: https://gitlab.com/gitlab-org/gitlab/issues/17584

pkgname=gitlab-pages
pkgver=1.16.0
pkgrel=1
pkgdesc='GitLab Pages daemon used to serve static websites for GitLab users'
url="https://gitlab.com/gitlab-org/$pkgname"
license=('MIT')
arch=('i686' 'x86_64')
depends=()
makedepends=('go')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/gitlab-org/$pkgname/repository/v$pkgver/archive.tar.gz"
	'config.cfg'
	"$pkgname.service"
	'service.env')
backup=("etc/$pkgname/config.cfg")
sha256sums=('4a90f6626a3cad402fe7117c6f1b6aa256c5da5d10002a13786fad662420d288'
            '5e2135793d43ec2f3343b49cf45b00f44ef74e813c7d152d2e0ed46af5c25122'
            'ae62235f0fd66eaed7ad74048daf21b92058aba90e40fc2d3e7a684e9883c32e'
            'fd8f9b60e2247077ad00765904237b6b1c36b11a952cd3b1ad88e74417b82a96')

prepare( ){
    cd "$pkgname-v$pkgver-"*
}

build() {
	cd "$pkgname-v$pkgver-"*
	make
}

package() {
	cd "$pkgname-v$pkgver-"*
	install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 "$srcdir/config.cfg" -t "$pkgdir/etc/$pkgname"
	install -Dm 644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/service.env" -t "$pkgdir/etc/$pkgname"
}
