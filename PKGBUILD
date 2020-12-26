# Maintainer: Krystian Chachuła <krystian@krystianch.com>
pkgname=route53-ddns-git
pkgver=r1.8eae15b
pkgrel=1
pkgdesc="Client for Route53 DDNS"
arch=('any')
url="https://git.sr.ht/~krystianch/route53-ddns"
license=('GPL')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/conf.d/route53-ddns')
source=('git+https://git.sr.ht/~krystianch/route53-ddns')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm644 "${pkgname%-git}".conf "$pkgdir"/etc/conf.d/"${pkgname%-git}"
    install -Dm644 "${pkgname%-git}".service "$pkgdir"/usr/lib/systemd/system/"${pkgname%-git}".service
    install -Dm755 "${pkgname%-git}" "$pkgdir"/usr/bin/"${pkgname%-git}"
}
