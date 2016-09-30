# Maintainer: vorpalblade77@gmail.com
pkgname=python2-gmpydl
pkgver=1.6
pkgrel=1
pkgdesc="Unofficial Google Music downloader (command line)"
arch=('any')
url="https://github.com/stevenewbs/gmpydl"
license=('MIT')
depends=('python2-gmusicapi')
makedepends=('python2-distutils-extra')
source=("https://github.com/stevenewbs/gmpydl/archive/v${pkgver}.tar.gz" "setup.py")
md5sums=('56c4d79009c1db4700364a07d5f4b18a'
         '1af70b7b6fd5bcd3c0881f98b9eb1758')

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
