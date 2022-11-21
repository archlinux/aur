# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-libarchive-c
pkgver=4.0
pkgrel=1
pkgdesc='Python interface to libarchive'
url='https://github.com/Changaco/python-libarchive-c'
arch=('any')
license=('CC0')
depends=('python38' 'libarchive')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-mock')
source=(https://github.com/Changaco/python-libarchive-c/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1544713802789859ffa9a0d8f4e490f720bbd4d589aae8899d0d1fb6780f2cde0db96f3023c1c32eacea07ea325ac180797aebdb0e8e37093af53807f2e5c812')
b2sums=('87f8cfb0adf080b11df85d065fbcc38bf5682592882b3a8a8077e5cfb590cc10a05b98c98a2be41570aa59d06899b2e47815183e563007b1077717cdaa79a21c')

prepare() {
  sed '/os.umask(2)/d' -i ${pkgbase}-${pkgver}/setup.py
}

check() {
  cd ${pkgbase}-${pkgver}
  LC_CTYPE=en_US.UTF-8 py.test
}

build() {
  cd ${pkgbase}-${pkgver}
  python3.8 setup.py build
}

package() {
  cd ${pkgbase}-${pkgver}
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
