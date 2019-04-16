# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zeebe-modeler
pkgver=0.6.2
pkgrel=1
pkgdesc="Desktop Application for modeling Zeebe Workflows with BPMN"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe-modeler"
license=('MIT')
depends=('nodejs' 'xdg-utils')
makedepends=('tar')
#install="$pkgname.install"
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/zeebe-io/zeebe-modeler/releases/download/v$pkgver/zeebe-modeler-$pkgver-linux-x64.tar.gz"
	"$pkgname.patch"
	"$pkgname-install.hook"
	"$pkgname-uninstall.hook")

prepare() {
	cd "$srcdir/$pkgname-$pkgver-linux-x64"
	patch --strip=1 --input=$srcdir/$pkgname.patch
}

package() {
	install -d $pkgdir/opt/$pkgname
	cp -R $srcdir/$pkgname-$pkgver-linux-x64/* $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/$pkgname-install.hook $pkgdir/usr/share/libalpm/hooks/$pkgname-install.hook
	install -Dm644 $srcdir/$pkgname-uninstall.hook $pkgdir/usr/share/libalpm/hooks/$pkgname-uninstall.hook
}
md5sums=('892b48eacdc2693180f731f484d12470'
         'd997b6d6c3831e0eb8a87b0ae59aa730'
         '7beb4a8cdb2deb5ddc55aaf71378f25d'
         'c84de27741e18024b942bfbc2b3a9a27')
