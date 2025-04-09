# Maintainer: Fleuria <fleuria at posteo dot co>
pkgname=uki-profilify
pkgver=0.2.1
pkgrel=1
pkgdesc="Multi-profile UKI creation helper"
url="https://codeberg.org/fleuria/uki-profilify"
arch=(any)
license=('Apache-2.0')
depends=('make' 'python' 'systemd-ukify>=257')
makedepends=('git')
optdepends=('bash: integration hooks'
            'mkinitcpio: UKI creation as post hook')

source=("git+${url}.git#tag=v${pkgver}?signed")
b2sums=('42a100c65e6644d77d9c29fd52f9f63467a9acf76704ed60cdaa1928a3d0c32df9fcd7ed349450705f94954ff59ef6b4a0b40a81630bf1eb72918a60d18abd9a')
validpgpkeys=(2B84434C4C160DCB81AA89D7EAFE660DC204C6A4)

package() {
	cd "$pkgname"
	gzip -c doc/$pkgname.8 > doc/$pkgname.8.gz

	install -D bin/uki-profilify $pkgdir/usr/bin/uki-profilify
	install -D mkinitcpio/uki-profilify \
		$pkgdir/usr/lib/initcpio/post/uki-profilify
	install -Dm644 doc/$pkgname.8.gz \
		$pkgdir/usr/share/man/man8/$pkgname.8.gz
}
