# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=nautilus-mediainfo
pkgver=1.0.3
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nautilus-mediainfo"
license=('GPL3')
depends=('python-mediainfodll' 'python-nautilus')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3be679ba190131b58e14a660027f2ecccbd3212007ec8fc58282a2a2b6757407')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's/MediaInfoDLL3/MediaInfoDLL/g' "nautilus-extension/$pkgname.py"
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm644 "nautilus-extension/$pkgname.py" -t \
    	"$pkgdir/usr/share/nautilus-python/extensions"
    install -d "$pkgdir/usr/share/nautilus-python/extensions/$pkgname"
    cp -a "nautilus-extension/$pkgname/locale/." \
    	"$pkgdir/usr/share/nautilus-python/extensions/$pkgname/locale"
}
