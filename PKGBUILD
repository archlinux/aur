# Maintainer: Michael Oestergaard <michael at bytopia dot dk>

pkgname="gcpuploader"
pkgver="2015.2.28"
pkgrel="3"
pkgdesc="A tool to upload FIT, GPX, and TCX files to the Garmin Connect web site."
arch=('any')
url="http://sourceforge.net/p/gcpuploader/wiki/Home/"
license=('GPL' 'APACHE')
makedepends=('python2-setuptools')
depends=('python2' 'python2-requests' 'python2-simplejson')
source=("http://downloads.sourceforge.net/${pkgname}/GcpUploader-${pkgver}.tar.gz")
sha256sums=('2b7c8a851c7e30a5d2c54aeda4d853cd25c65fa47b70700259d318089af8257a')
install="gcpuploader.install"

package() {
  cd "${srcdir}/GcpUploader-${pkgver}"

  sed -i 's/^#!\/usr\/bin\/python$/#!\/usr\/bin\/python2/' gupload.py
  sed -i 's/^#!\/usr\/bin\/python$/#!\/usr\/bin\/python2/' setup.py
  sed -i 's/version = "2015.02.28"/version = "2015.2.28"/' setup.py
  sed -i "s/'ez_setup', //" setup.py
  sed -i '3,8d' setup.py

  install -Dm644 README.txt ${pkgdir}/usr/share/${pkgname}/README
  install -Dm644 guploadrc_example.txt ${pkgdir}/usr/share/${pkgname}/guploadrc_example.txt
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
