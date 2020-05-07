# Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-screeninfo
pkgver=0.6.5
pkgrel=3
pkgdesc="Python library to fetch location and size of physical screens"
arch=('any')
url="https://github.com/rr-/screeninfo"
license=('MIT')
depends=('python')
optdepends=('libxinerama: xinerama backend'
           'libxrandr: randr backend'
           'libdrm: experimental DRM backend')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rr-/${pkgname/python-/}/archive/${pkgver}.tar.gz"
        'dont_require_dataclasses.patch::https://github.com/rr-/screeninfo/commit/3dcaa513732f4dec236187ef227580975ce5f01c.patch')
sha256sums=('06ef4146276bd4f8a3635fff44324c0a4e86b200155dea089da96ae4cd1741a6'
            '18c8f4be21d4a3413c63e4e3d61c255615b23d86706c880ab05139b6525721c8')

prepare() {
  cd "${srcdir}/${pkgname/python-/}-${pkgver}"
  patch -Np1 -i ../dont_require_dataclasses.patch
}

package() {
  cd "${srcdir}/${pkgname/python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname/python-/}-${pkgver}/LICENSE.md"
}
