# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Invergo <brandon@invergo.net>

pkgname=img2pdf-git
pkgver=0.2.0.r20.gc158585
pkgrel=1
pkgdesc="Losslessly convert images to PDF without unnecessarily increasing file size by re-encoding JPEG files."
arch=('any')
url="https://gitlab.mister-muffin.de/josch/img2pdf"
license=('LGPL3')
depends=('python' 'python-pillow')
makedepends=('git' 'python-setuptools')
conflicts=("${pkgname%-*}" "python-${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver:0:5}")
options=(!emptydirs)
source=("git+http://gitlab.mister-muffin.de/josch/img2pdf.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}"

	msg "GIT checkout done or server timeout"
	msg "Starting setup.py..."

	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname%-*}"

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
