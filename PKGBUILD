# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Invergo <brandon@invergo.net>

pkgname=img2pdf-git
epoch=1
pkgver=0.3.6.r17.a84a1b8
pkgrel=1
pkgdesc="Losslessly convert images to PDF without unnecessarily increasing file size by re-encoding JPEG files."
arch=('any')
url="https://gitlab.mister-muffin.de/josch/img2pdf"
license=('LGPL3')
depends=('python-pillow' 'python-pikepdf')
makedepends=('git' 'python-setuptools')
conflicts=("${pkgname%-*}" "python-${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver:0:5}")
source=("git+http://gitlab.mister-muffin.de/josch/img2pdf.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "${srcdir}/${pkgname%-*}"

	msg "Starting setup.py..."

	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname%-*}"

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
