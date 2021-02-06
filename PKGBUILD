# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=3.2.1.20201118
_commit=3351756acd36fa873d8f42db2966cfb7c38bb533
pkgrel=4
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/linode/linode-cli"
license=('BSD')
depends=('python-colorclass' 
	 'python-terminaltables' 
	 'python-requests' 
	 'python-yaml')
optdepends=('python-boto: Object Storage plugin')
makedepends=('python-wheel')
replaces=('linode-cli-dev')
install="${pkgname}".install
source=("${pkgname}-${_commit}.tar.gz::https://github.com/linode/linode-cli/archive/${_commit}.tar.gz"
	'no-python2.patch')
sha256sums=('024feb6d45aebb62e375eaef171ea11de5e202f887be86cefbde37b96aa104d5'
            '7a3f1e454ffac21db74ad1e1b8575f4246566fb25966b89a2e30fa8215dd8c13')

prepare() {
  mv ${pkgname}-{$_commit,$pkgver}
  cd "${pkgname}-${pkgver}"
  patch --strip=1 --input="${srcdir}/no-python2.patch"
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
