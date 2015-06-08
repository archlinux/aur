# Maintainer: vorpalblade77@gmail.com
pkgname=python2-gmpydl
pkgver=1.0
pkgrel=1
pkgdesc="Unofficial Google Music downloader (command line)"
arch=('any')
url="https://github.com/stevenewbs/gmpydl"
license=('MIT')
depends=('python2-gmusicapi')
makedepends=('python2-distutils-extra')
source=("https://github.com/stevenewbs/gmpydl/archive/V${pkgver}.tar.gz" "setup.py")
md5sums=('d6b337d556a39cda3017fac3f3601cb8'
         '139fe6a9637fe0e2cb9bbdf215d59f5c')

build() {
	cd "${srcdir}/${pkgname#python2-}-${pkgver}"
	sed -i 's:\(env[ ]\+python$\|/usr/bin/python$\):\12:g' $(find . -regex ".*\.py\|.*\.recipe")
	cp ../../setup.py .
	python2 setup.py build
}

package() {
	cd "${srcdir}/${pkgname#python2-}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" \
	--prefix=/usr \
	--compile -O1
	install -D LICENSE "${pkgdir}/usr/share/licenses/python2-gmpydl/LICENSE"
	install -d "${pkgdir}/usr/bin"
	echo "#!/usr/bin/bash" >> "${pkgdir}/usr/bin/gmpydl"
	echo "python2 /usr/lib/python2.7/site-packages/gmpydl.py" >> "${pkgdir}/usr/bin/gmpydl"
	chmod a+x "${pkgdir}/usr/bin/gmpydl"
}
