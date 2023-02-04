# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=sshconfig
pkgname="python-${_pkgname}"
pkgver=2.2
pkgrel=1
pkgdesc="SSH config file generator"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('GPL3')
depends=('python'
         'python-appdirs' 'python-arrow' 'python-docopt' 'python-inform' 'python-shlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KenKundert/sshconfig/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/KenKundert/sshconfig/releases/download/v$pkgver/sshconfig-$pkgver.tar.gz.asc")
sha256sums=('f0b480c8d09d7e8ad44a645f698a407af60f38db666640fb37ea74adf8b37f1a'
            'SKIP')
b2sums=('19a135463b6399c5a9b4d2a2f68c2b19804af8d9a73a0b33ad9145916b29a1db7348fe44b5f3fd55fe180a8004225f7603fe2e8c24a9f7ac66255883fb5b8c76'
        'SKIP')
validpgpkeys=(
  '4A47DE443CEE6D70A892347A9B8FFF1D3E1C0A50' # Kenneth Scott Kundert <ken@designers-guide.com>
)

build() {
  cd "${_pkgname//-/_}-$pkgver"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
