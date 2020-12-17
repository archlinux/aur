# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=3.2.1
pkgrel=3
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/linode/linode-cli"
license=('BSD')
depends=('python-colorclass' 
	 'python2-colorclass' 
	 'python-terminaltables' 
	 'python2-terminaltables' 
	 'python-requests' 
	 'python2-requests' 
	 'python-yaml' 
	 'python2-yaml' 
	 'python2-enum34')
optdepends=('python-boto: Object Storage plugin')
makedepends=('python-wheel' 
	     'python2-wheel')
replaces=('linode-cli-dev')
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linode/linode-cli/archive/${pkgver}.tar.gz"
	'enum34-extra-requires.patch')
sha256sums=('cf4f86af83d2b25ad0d4261a95e91e4128733734ce84eb2b3b4cdf8b03c8c3b6'
            '3c05e163748ec607c3f6d62587e04911af2e593e25635c7acef39cd2d03f9f2e')

prepare() {
  cd "${pkgname}-${pkgver}" 
  patch --strip=2 --input="${srcdir}/enum34-extra-requires.patch"
}

build() {
  cd "${pkgname}-${pkgver}" 
  make build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
