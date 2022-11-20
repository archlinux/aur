# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=tomlkit
pkgname=python38-tomlkit
pkgver=0.11.6
pkgrel=1
pkgdesc="Style-preserving TOML library for Python"
url="https://github.com/sdispater/tomlkit"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-build'
             'python38-installer'
             'python38-poetry-core'
             'python38-wheel')
checkdepends=('python38-pytest'
              'python38-yaml')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('692f2facb18440609b63995f690f4ba29e82d696f5ce612f872499b4a42bb0ab33fcbf52abf36057c25448b3e29f30955dbc7e0ba34f10d21cb9b5d36e9ad9bf')

build() {
  cd tomlkit-$pkgver
  python3.8 -m build -wn
}

check() {
  cd tomlkit-$pkgver
  pytest
}

package() {
  cd tomlkit-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
