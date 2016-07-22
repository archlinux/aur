# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgbase=transwhat
pkgname=('python-transwhat' 'python2-transwhat')
pkgver=0.2
pkgrel=4
epoch=1
pkgdesc="A gateway between the XMPP and the WhatsApp IM networks"
arch=('any')
url="https://github.com/stv0g/transwhat"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools' 'protobuf' 'python2-protobuf' 'python-pillow' 'python2-pillow' 'python-dateutil' 'python2-dateutil' 'python-yowsup>=2' 'python2-yowsup>=2' 'python-e4u' 'python2-e4u')
options=('!strip' '!emptydirs')

source=("$pkgbase-$pkgver.tar.gz"::"git+http://github.com/stv0g/transwhat.git#branch=setuptools")
sha512sums=(SKIP)

build(){
  cd $srcdir
  cp -r transwhat-${pkgver} python2-transwhat-${pkgver}
}

package_python-transwhat() {
  depends=('python' 'protobuf' 'python-pillow' 'python-dateutil' 'python-yowsup>=2' 'python-e4u')

  cd "${srcdir}/transwhat-${pkgver}"
  python3 setup.py install --root=$pkgdir --optimize=1
}

package_python2-transwhat() {
  depends=('python2' 'python2-protobuf' 'python2-pillow' 'python2-dateutil' 'python2-yowsup>=2' 'python2-e4u')

  cd "${srcdir}/python2-transwhat-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}

check(){
  cd ${srcdir}/transwhat-${pkgver}
  python3 setup.py test

  cd ${srcdir}/python2-transwhat-${pkgver}
  python2 setup.py test
}