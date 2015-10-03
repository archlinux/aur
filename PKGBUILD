# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Invergo <brandon@invergo.net>

pkgname=img2pdf-git
pkgver=0.1.6
pkgrel=2
pkgdesc="Losslessly convert images to PDF without unnecessarily increasing file size by re-encoding JPEG files."
arch=('any')
url="https://gitlab.mister-muffin.de/josch/img2pdf"
license=('LGPL3')
depends=('python2' 'python2-pillow')
makedepends=('git' 'python2-setuptools')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver}")
options=(!emptydirs)
source=("git+http://gitlab.mister-muffin.de/josch/img2pdf.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
    msg "Checking current version..."
     git_ver=`git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'`
     echo "${git_ver/#${git_ver:0:5}/${pkgver:0:5}}"
}

build() {
  cd "${srcdir}/${pkgname%-*}"

  msg "GIT checkout done or server timeout"
  msg "Starting setup.py..."

  python2 setup.py build
}

package() {

  cd "${srcdir}/${pkgname%-*}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" #--optimize=1
}
