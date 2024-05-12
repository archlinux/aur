# Maintainer: ShoreNinth <shoreninth@outlook.com>

_pkgname=goby
pkgname=goby-community
pkgver=2.9.4
pkgrel=1
pkgdesc="Attack surface mapping"
arch=("x86_64")
url="https://gobies.org/"
license=('unknown')
options=("!strip" "!debug")
depends=(
	"atk"
	"gtk3"
	"libpcap"
)
makedepends=(
	'unzip'
	"libcap"
	)
source=(
	"https://$_pkgname-storage-public.oss-cn-beijing.aliyuncs.com/$pkgver/$_pkgname-linux-x64-$pkgver-Community.zip"
	"$pkgname.desktop"
	"$pkgname.png"
	)
sha256sums=(
	'4f9da788a46090f5cb79080359d069c896dc0e4e6ae705c0a49821e2f62c7a6d'
	'0624f9c1aa7377ccb5bd6b6a54a3dbea3cdd1a1e838a154c73bd01d22ff5fc3f'
	'11e10dc114bd6cd8ecfe018b277798f1c7727f113c15ebc09090682f8575bb1f'
)
prepare() {
	cd "${srcdir}"
	unzip -q -o $_pkgname-linux-x64-$pkgver-Community.zip
}

package() {
#	cd $srcdir/$pkgname

	install -d $pkgdir/{opt/$pkgname,usr/bin}
	mv ./$_pkgname-linux-x64-$pkgver/* $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/goby $pkgdir/usr/bin/$pkgname

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	chmod -R ugo+rwX $pkgdir/opt/$pkgname
	setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' $pkgdir/opt/$pkgname/golib/goby-cmd-linux
}
