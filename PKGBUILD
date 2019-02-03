# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Useful: https://gitlab.com/gitlab-org/gitlab-ce/issues/29963
pkgname=gitlab-pages
pkgver=1.5.0
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
sha256sums=('52af7ace4d5146738db30b5b5c9337059a0babca803468ccaf9fbf6e61de5e61'
            '26f9ffde23377b0f83006f8441f31697acb15e0fabe1a63ae4c815faf544b6f2'
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
