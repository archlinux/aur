# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=painter
pkgname="python-${_pkgname}"
pkgver=0.3.1
pkgrel=1
pkgdesc="Your own expressive painter who colors text in your terminal."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('3373463d584ba9bbbb23d570c37893e7930b93704fe1149df88e9d2ef906fc88'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('08f0be45dc3191c640cbf8d549d91acf32fe5aaf3348943b8a87a377006bec881d8e14d67d7268e6e912afe75f30a874f136c9be693da8e697b58d5778621c99'
        '5c26d1be5d4ee3c05ac90a8118a23de7ebde909290075cc7c1df4acab355f06417e5a32052f56e313ddaa7cc16d4cfb721c9931dffe58105917180bcae40b719')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

check() {
  cd "${_pkgname/-/_}-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
