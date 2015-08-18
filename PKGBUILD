# Maintainer: Ethan Schoonover <es@ethanschoonover.com> @ethanschoonover IRC/BBS/AUR:altercation

pkgname=gam
pkgver=3.51
pkgrel=1
holdver=$pkgver
pkgdesc="CLI frontend to Google Apps Provisioning API"
arch=('any')
url="http://code.google.com/p/google-apps-manager/"
license=('Apache')
depends=('python2')
makedepends=('unzip')
optdepends=()
provides=()
source=("https://github.com/jay0lee/GAM/archive/v${pkgver}.tar.gz")
noextract=("v${pkgver}.tar.gz")
md5sums=('0ab658cb70b375a4634d477edcd02123')

build() {
	cd $srcdir
	mkdir build
	tar --gzip --extract --overwrite --strip-components=1 --directory=build --file=v${pkgver}.tar.gz
}

package() {
	cd "${srcdir}/build"
	install -d ${pkgdir}/opt/${pkgname}
	install -d ${pkgdir}/usr/bin
	touch ${pkgdir}/opt/${pkgname}/noupdatecheck.txt
	touch ${pkgdir}/opt/${pkgname}/nobrowser.txt
	cp -af * ${pkgdir}/opt/${pkgname}/
	echo "python2 /opt/${pkgname}/gam.py \"\$@\"" > ${pkgdir}/usr/bin/gam
	chmod 0755 ${pkgdir}/usr/bin/gam
	rm -rf ../build
}
