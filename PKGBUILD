# Maintainer: k8ie <k8ie@mcld.eu>
pkgname='proidcm'
pkgver=1.0.2
pkgrel=2
_filename="${pkgname}-${pkgver}-0.amd64"
pkgdesc="Graphical utility for managing ProID Smart Cards"
depends=(libproidplus-gui qt6-base)
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')
source=("${pkgname}-${pkgver}-0.amd64.deb.zip::https://monetplusappcenter.blob.core.windows.net/packages/1aba3679-25ec-4ca2-b854-c787550a6753/1.0.2/proidcm-1.0.2-0.amd64.deb.zip?sv=2025-01-05&spr=https&se=2025-08-04T11%3A04%3A55Z&sr=b&sp=r&sig=%2FMeS%2B%2F2Mbs8rHnZf1%2FEipUysYXtndsqAfP5fXAzpzQk%3D")
sha256sums=('f6bbe248c96a8b84132d99154eaa845f71b5fcbbb844fa13f3c8d4c5ea0b6eea')

prepare () {
	mkdir "$srcdir/$pkgname"
	bsdtar -C "$srcdir/$pkgname" -xf "$srcdir/${_filename}.deb.zip"
	bsdtar -C "$srcdir/$pkgname" -xf "$srcdir/$pkgname/${_filename}.deb"
	echo "$(cat $srcdir/$pkgname/${_filename}.deb.sha256 | cut -d ' ' -f1) $srcdir/$pkgname/${_filename}.deb" | sha256sum --check --status
}

package () {
	bsdtar -C "$pkgdir" -xf "$srcdir/$pkgname/data.tar.xz"
	# mv "$pkgdir/usr/lib/x86_64-linux-gnu/pkcs11" "$pkgdir/usr/lib/pkcs11"
	# ln -s "/usr/lib/x86_64-linux-gnu/libproidproxyp11.so" "$pkgdir/usr/lib/pkcs11/"
	find $pkgdir -type d -exec chmod -c 755 {} +
	# sed -i 's/libproidcm11.so/libproidproxyp11.so/g' "$pkgdir/usr/share/p11-kit/modules/proidplus.module"
}
