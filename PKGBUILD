# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

_base=starpy
pkgname=python2-${_base}
pkgver=1.0.3
pkgrel=1
arch=(any)
pkgdesc="Twisted Protocols for interaction with Asterisk PBX"
license=('custom:"StarPy License"')
url="https://github.com/asterisk/${_base}"
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('09c72de90d0220a9b9d532710b1b845acf2df2ee015754440f994f25b33e379d5a958c0f61c04a07938c2926e890233351a4059cd905825d8de6953843a56d73')
depends=(python2-twisted) # python2-basicproperty
# makedepends=(python2-setuptools)

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
  find $pkgdir -type d -name examples -or -name doc -or -name .svn | xargs rm -rf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
