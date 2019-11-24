# Maintainer:  thoth <thoth@mailoo.org>
pkgname=python-odrive
_pkgnamepython=odrive
pkgver=0.4.11
pkgrel=1
pkgdesc="python tools for odrive motors"
arch=('any')
url="https://github.com/madcowswe/ODrive"
license=('MIT')
depends=('ipython' 'python-pyusb' 'python-pyserial' 'python-requests' 'python-intelhex')
optdepends=('python-matplotlib: required to run the liveplotter')


source=("https://files.pythonhosted.org/packages/source/${_pkgnamepython::1}/${_pkgnamepython}/${_pkgnamepython}-${pkgver}.tar.gz")


sha256sums=('fa0db10c827192955bdbfa6327e4e839c7999b4086b5162e1569dc149530bab7')
noextract=()

build() {
  cd "${srcdir}/${_pkgnamepython}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgnamepython}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  mkdir -p ${pkgdir}/usr/lib/udev/rules.d
  echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="1209", ATTR{idProduct}=="0d[0-9][0-9]", MODE="0666"' | tee ${pkgdir}/usr/lib/udev/rules.d/91-odrive.rules

  wget "https://github.com/madcowswe/ODrive/raw/master/LICENSE.md"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



# vim:set ts=2 sw=2 et:
