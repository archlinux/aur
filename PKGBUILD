# Maintainer: Martin Jindra <mjindra[at]derchef[dot]email>

pkgname=volatility3-git
pkgver=v2.0.0.3081.a2b0bdfe
pkgrel=1
pkgdesc='Advanced memory forensics framework'
url='https://github.com/volatilityfoundation/volatility3'
arch=('any')
license=('custom')
depends=(
  'python' 'python-yara' 'python-capstone' 'python-jsonschema'
  'python-pycryptodome' 'python-pefile')
makedepends=('python-setuptools' 'git')
provides=('volatility')
replaces=('volatility')
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
