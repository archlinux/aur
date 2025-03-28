# Maintainer: Fleuria <fleuria at posteo dot co>
pkgname=uki-profilify
pkgver=0.2.0
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
b2sums=('55a1a841007dcd24b2794bb1d17c0938275375601f86ae88d6190595ec12e06c1669811424b8ec1d63f3623847a9e1abdff2700d68b7913ee68b6e8edd2ec390')
validpgpkeys=(2B84434C4C160DCB81AA89D7EAFE660DC204C6A4)

package() {
	cd "$pkgname"
	gzip -c doc/$pkgname.8 > doc/$pkgname.8.gz

	install -D bin/uki-profilify.py $pkgdir/usr/bin/uki-profilify
	install -D mkinitcpio/uki-profilify.sh \
		$pkgdir/usr/lib/initcpio/post/uki-profilify
	install -Dm644 doc/$pkgname.8.gz \
		$pkgdir/usr/share/man/man8/$pkgname.8.gz
}
