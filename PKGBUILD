# Maintainer: Fleuria <fleuria at posteo dot co>
pkgname=uki-profilify
pkgver=0.1.4
pkgrel=4
pkgdesc="Multi-profile UKI creation helper"
url="https://codeberg.org/fleuria/uki-profilify"
arch=(any)
license=('Apache-2.0')
depends=('python' 'systemd-ukify>=257')
makedepends=('git')
optdepends=('bash: integration hooks'
            'mkinitcpio: UKI creation as post hook')

source=("git+${url}.git#tag=v${pkgver}?signed")
sha256sums=('370656d8c7c7a72db8fb65500d1699a0775b290407603da44cd64f95d28b679c')
validpgpkeys=(2B84434C4C160DCB81AA89D7EAFE660DC204C6A4)

package() {
	cd "$pkgname"
	gzip -c doc/$pkgname.1 > doc/$pkgname.1.gz

	install -D bin/uki-profilify.py $pkgdir/usr/bin/uki-profilify
	install -D mkinitcpio/invoke-uki-profilify.sh \
		$pkgdir/usr/lib/initcpio/post/invoke-uki-profilify.sh
	install -Dm644 doc/$pkgname.1.gz \
		$pkgdir/usr/share/man/man1/$pkgname.1.gz
}
