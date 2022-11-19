# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-xmlschema
_pkgname="${pkgname#python38-}"
pkgver=2.1.1
pkgrel=1
pkgdesc='An XML Schema validator and decoder'
arch=('any')
url='https://github.com/sissaschool/xmlschema'
license=('MIT')
depends=('python38' 'python38-elementpath')
makedepends=(
  'git'
  'python38-build'
  'python38-installer'
  'python38-wheel'
  'python38-setuptools'
)
checkdepends=('python38-lxml' 'python38-jinja')
optdepends=('python38-jinja: for XSD based code generators')
_commit='a2165b49e66ad123a3d005cbf8e173e4c5139248'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD" python3.8 -m unittest
}

package() {
  cd "$pkgname"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
