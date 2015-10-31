# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname="ravello"
pkgver=2.0
pkgrel=1
pkgdesc="ravello systems tool"
url="https://www.ravellosystems.com/"
license=('Unknown')
source=("http://import-tool.ravellosystems.com/linux/ravello_linux.tar.gz")
sha512sums=('713bf014178f70c00570eddf2a58abac4ad6d7217ae2e882742e872a9007c01952b2f70a172a3bcee55fbb66f79f13b682868b4f4567fc06f5124d61599bd317')
arch=('any')
depends=('python2' 'python2-pysphere')
makedepends=('python2-setuptools')
conflicts=("${_gitname}")
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    tar xvf ravello*.tar.gz &> /dev/null
    cd ravello* 
    printf $(python2 setup.py --version)
  )
}

package() {
  cd "${srcdir}/${pkgname}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set et sw=2 sts=2 tw=80: