# Maintainer: ShoreNinth <shoreninth@outlook.com>

_pkgname=goby
pkgname=goby-community
pkgver=2.9.2
pkgrel=1
pkgdesc="Attack surface mapping"
arch=("x86_64")
url="https://gobies.org/"
license=('unknown')
options=("!strip" "!debug")
depends=(
	"atk"
	"gtk3"
)
makedepends=('unzip')
source=(
	"https://$_pkgname-storage-public.oss-cn-beijing.aliyuncs.com/$pkgver/$_pkgname-linux-x64-$pkgver-Community.zip"
	"$pkgname.desktop")
sha256sums=(
	'e9ecd230b3e2fed975b7a49ea6f3c2bf3f4a819170763dd59d826e45a9ca051b'
	'0624f9c1aa7377ccb5bd6b6a54a3dbea3cdd1a1e838a154c73bd01d22ff5fc3f'
)
prepare() {
	cd "${srcdir}"
	unzip  -o $_pkgname-linux-x64-$pkgver-Community.zip
}

package() {
#	cd $srcdir/$pkgname

	install -d $pkgdir/{opt/$pkgname,usr/bin}
	mv ./$_pkgname-linux-x64-$pkgver/* $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/goby $pkgdir/usr/bin/$pkgname

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	chmod -R ugo+rwX $pkgdir/opt/$pkgname
}
