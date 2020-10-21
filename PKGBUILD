# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.6
pkgrel=2
pkgdesc="Python's missing debug print command and other development tools."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('3f2d4eb2de2a8501c41330524414b495d7bbf3066384b3cec5fa784a0d07099b'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('e2cfdfdd8c52204df8c6bcebe99a200aec57bba9c0cb36f44a5e38993f928a49ce89ff0e59101a3781918a6fb4be9decf27edf59ddf4e98c5eb44674a9294fe1'
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
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
