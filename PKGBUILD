# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributor: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.22
pkgrel=2
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('any')
url="https://www.debian.org/"
license=('GPL-2.0-only' 'GPL-2.0-or-later')
changelog=ChangeLog
depends=(gettext perl intltool)
source=("${pkgname}-${pkgver}.deb::https://deb.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}_all.deb")
sha256sums=('e40fb5a74cb23cf5d25f49474a8092af35d855fba4a32c6f9bb4fba85d4dae68')

latestver() {
	curl -fsSL "https://deb.debian.org/debian/pool/main/p/po-debconf/" |
	grep -oE "${pkgname}_[0-9.]+_all.deb" |
	sed -E "s/^${pkgname}_//; s/_all.deb$//" |
	sort -V |
	tail -n1
}

build() {
	cd "$srcdir"
	ar -x "$srcdir/${pkgname}-${pkgver}.deb" data.tar.xz
	tar -xJf data.tar.xz
}

package() {
	cp -r "$srcdir/usr" "$pkgdir"
	install -Dm644 "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
