# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=3.1.2
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/linode/linode-cli"
license=('BSD')
makedepends=('python-wheel' 
	     'python2-wheel')
depends=('python-colorclass' 
	 'python2-colorclass' 
	 'python-terminaltables' 
	 'python2-terminaltables' 
	 'python-requests' 
	 'python2-requests' 
	 'python-yaml' 
	 'python2-yaml' 
	 'python2-enum34')
replaces=('linode-cli-dev')
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linode/linode-cli/archive/${pkgver}.tar.gz"
	'enum34-extra-requires.patch')
sha256sums=('e14dabd83421de0e9ea7c7eb8a927effdf276c3127247f31f0c75f3aeff9204d'
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
