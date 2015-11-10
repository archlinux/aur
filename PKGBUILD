# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname="ravello"
pkgver=2.0
pkgrel=2
pkgdesc="ravello systems tool"
url="https://www.ravellosystems.com/"
license=('Unknown')
source=("http://import-tool.ravellosystems.com/linux/ravello_linux.tar.gz"
        "ravello.patch")
sha512sums=('14f76391aa2ee7d147430b9885cc759eacb7cffb52539ea503f8f26c962c0c2d81afac8168bf32921449841befbf655e1a7f3989cf814c748a2403c4061d8cfd'
            '6e8c4ba79bc7c9b595e53068528cac7ed76f45f6c4e1292cd88b468c5e113580da401f70d756dd3dae475dbc89acddffb6b4e329fc2b2b212b72fce6afc53ad5')
arch=('any')
depends=('python2' 'python2-pysphere' 'python2-requests' 'python2-pefile-git'
'python2-argparse' 'python2-jsonpickle' 'python2-webpy' 'python2-mimerender'
'python2-boto')

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

prepare() {
  cd "${srcdir}"
  patch -Np0 -i "$srcdir/ravello.patch"
}

package() {
  cd "${srcdir}/${pkgname}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set et sw=2 sts=2 tw=80:
