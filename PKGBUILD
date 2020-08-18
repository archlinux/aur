# Maintainer: Donald Webster <fryfrog@gmail.com>

# The script that controls the fanshim is not part of the pypi release. And the releases track the fanshim library,
# not the script. So we'll track this package version on the library, but pin the hash of the script and bump the
# pkgrel to update.

pkgname=fanshim
_name=fanshim
pkgver=0.0.5
pkgrel=3
_scripthash="5a23a4661258db90ce347d2ba1e1ad284af6566c"
pkgdesc="Automatic control of Pimoroni Fan Shim for Raspberry Pi."
arch=('any')
url="https://github.com/pimoroni/fanshim-python"
license=('MIT')
depends=(
  'python'
  'python-psutil'
  'python-plasmalights'
  'python-raspberry-gpio'
  'python-spidev'
  'python-apa102'
)
makedepends=('python-setuptools')

source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  "fanshim-${_scripthash}.py::https://raw.githubusercontent.com/pimoroni/fanshim-python/${_scripthash}/examples/automatic.py"
  'fanshim.service'
)

sha512sums=('e81de34579c6d3312a4647fae3a11bae034769f28b3bdef01b2bf8a32fdd5e49900c8bf9a063f4875fb9a2880c5e54a70847d0a479254782500eda02f1b15979'
            '0a469afdb5f7d3f7b6a2e508ef98640fb21c93d4c6900dca2692641372c1fff33ae407ea070cfead21ee3d9cfc3cf85cef5802e3b1284cc9bb6fd236fb767ccc'
            '10bf465ab1d5d5a769ad2f656030cd6e9cf247efc0a7446797ae2df70bc10e91f1e0b5a478f68a46974a3aa84c01f35bd4119c17739b1bbb0cb98806382354e5')

package() {
  cd fanshim-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 755 "${srcdir}/fanshim-${_scripthash}.py" "${pkgdir}/usr/bin/fanshim"
  install -D -m 644 "${srcdir}/fanshim.service" "${pkgdir}/usr/lib/systemd/system/fanshim.service"
}

# vim:set ts=2 sw=2 et:
