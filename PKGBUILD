# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=acme.sh-systemd
pkgver=0.1.0
pkgrel=1
pkgdesc="Use systemd check for acme.sh (Let’s Encrypt) renewals"
arch=('any')
url="https://github.com/unknowndev233/acme.sh-systemd"
license=('LGPL3')
depends=('systemd>=240' 'acme.sh')
backup=('etc/acme.sh')
source=("${pkgname}-${pkgver}::https://github.com/unknowndev233/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f63a106a4c9890ba466a19a475ccbe4ab88e122ffae295df3c78135e664eb52d13ebf2a296655f66c92ac981dfd98f899c4954bab793f162e316eb59ab6c903a')

package() {
	sed -i '7 s/#Type=exec/Type=exec/'                            "$srcdir/${pkgname}-${pkgver}/acme.sh.service"
	sed -i '8 s/Type=simple/#Type=simple/'                        "$srcdir/${pkgname}-${pkgver}/acme.sh.service"
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/acme.sh.service" "$pkgdir/usr/lib/systemd/system/acme.sh.service"
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/acme.sh.timer"   "$pkgdir/usr/lib/systemd/system/acme.sh.timer"
	mkdir -pm 0700 "$pkgdir/{etc,var/log}/acme.sh"
}
