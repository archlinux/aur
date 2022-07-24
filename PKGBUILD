# Maintainer: Martin Jindra <mjindra[at]derchef[dot]email>

pkgname=volatility3-git
pkgver=v2.0.1.3394.334f7a93
pkgrel=1
pkgdesc='Advanced memory forensics framework'
url='https://github.com/volatilityfoundation/volatility3'
arch=('any')
license=('custom')
depends=(
  'python>3.6' 'python-yara' 'python-capstone' 'python-jsonschema'
  'python-pycryptodome' 'python-pefile')
makedepends=('python-setuptools' 'git')
provides=('volatility3')
conflicts=('volatility3')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags $(git rev-list --tags --max-count=1))" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --prefix=/usr --root="${pkgdir}" --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
