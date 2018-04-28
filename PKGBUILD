# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Useful: https://gitlab.com/gitlab-org/gitlab-ce/issues/29963
pkgname=gitlab-pages
pkgver=0.9.0
pkgrel=1
pkgdesc='GitLab Pages daemon used to serve static websites for GitLab users'
url='https://gitlab.com/gitlab-org/gitlab-pages'
license=('MIT')
arch=('i686' 'x86_64')
depends=()
makedepends=('go')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/gitlab-org/gitlab-pages/repository/v$pkgver/archive.tar.gz"
	'config.cfg'
	'gitlab-pages.service'
	'service.env')
backup=('etc/gitlab-pages/config.cfg')
sha256sums=('90e3c873382e42caccce0f4ab1b1a3bfef510849500eab28409f72661a557e16'
            '558e9f5ec85fbf4ef7380016e64bcf00f09498596044f76a8eb87b6ef4154ce4'
            'ae62235f0fd66eaed7ad74048daf21b92058aba90e40fc2d3e7a684e9883c32e'
            'fd8f9b60e2247077ad00765904237b6b1c36b11a952cd3b1ad88e74417b82a96')

build() {
	cd "$srcdir/$pkgname-v$pkgver-"*
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver-"*
	install -Dm 755 gitlab-pages "$pkgdir/usr/bin/gitlab-pages"
	install -Dm 644 "$srcdir/config.cfg" "$pkgdir/etc/gitlab-pages/config.cfg"
	install -Dm 644 "$srcdir/gitlab-pages.service" "$pkgdir/usr/lib/systemd/system/gitlab-pages.service"
	install -Dm 644 "$srcdir/service.env" "$pkgdir/etc/gitlab-pages/service.env"
}
