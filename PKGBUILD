# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=img2pdf-git
pkgver=0.1.6
pkgrel=1
pkgdesc="Losslessly convert images to PDF without unnecessarily re-encoding JPEG and JPEG2000 files. Image quality is retained without unnecessarily increasing file size."
arch=('any')
url="https://gitlab.mister-muffin.de/josch/img2pdf"
license=('LGPL3')
depends=('python' 'python-pillow' 'python-setuptools')
makedepends=('git')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver}")
options=(!emptydirs)
source=("git+http://gitlab.mister-muffin.de/josch/img2pdf.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
    msg "Checking current version..."
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-*}"

  msg "GIT checkout done or server timeout"
  msg "Starting setup.py..."

  python setup.py build
}

package() {

  cd "${srcdir}/${pkgname%-*}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
