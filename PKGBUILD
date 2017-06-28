# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=phoxi
pkgdesc="PhoXi camera software suite"
pkgver=1.1.32
pkgrel=1
arch=(x86_64)
license=(custom)
url=http://www.photoneo.com/product-detail/phoxi-control-application/

options=("!strip")
depends=(qt5-base opencv openssl pcl vtk)

source=(
	"http://photoneo.com/files/PhotoneoPhoXiControl-$pkgver-Ubuntu16.04-LTS-64-gcc5.4.tar"
)
sha512sums=('b38815e8dcb29205ae352e214db193635b0ec7c1b6f934e2e27b677426111cbcabb0789aa24fd6cc0d7cb27c0a3bc71436b01ff669642eae8d424a860a6d411c')

prepare() {
	mkdir -p "$srcdir/phoxi"
	bsdtar -xf "PhotoneoPhoXiControl-$pkgver-Ubuntu16.04-LTS-64-gcc5.4.tar"
	sh PhotoneoPhoXiControl-$pkgver-Ubuntu16.04-LTS-64-gcc5.4.run --noexec --target "$srcdir/phoxi"
}

package() {
	cd "$srcdir/phoxi"

	# install in /opt
	mkdir -p "$pkgdir/opt"
	cp -a --no-preserve=ownership "$srcdir/phoxi"  "$pkgdir/opt/phoxi"
	chmod +rX -R "$pkgdir/opt/phoxi"

	echo "Don't forget to add 'export PHOXI_CONTROL_PATH=/opt/phoxi' to your environment."
}
