# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=adminapi
_srcname=serveradmin
pkgname="python-${_name}"
conflicts=("python-${_name}-git")
pkgver=1.9.3
pkgrel=1
pkgdesc='Adminapi is a python module which can be used to talk to the open source serveradmin project by Innogames'
arch=('any')
url="https://github.com/InnoGames/${_srcname}"
makedepends=('python-setuptools')
depends=('python' 'python-ipaddress' 'python-netaddr')
provides=('python-adminapi')
conflicts=('python-adminapi')
license=('MIT')
source=(
  "${_srcname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  'adminapi-only.patch'
)
sha256sums=(
  '6894667093950f9120961e530cc74514575655c6fb2b8c7f010308d4743f1c4c'
  '086a0f7a7b935b27e1ece35d99202b4db10f6b5a4406dd45affba2bfaf89a08e'
)


package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  patch < ../adminapi-only.patch
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
