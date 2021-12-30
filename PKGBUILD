# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Joachim Desroches <joachim.desroches@epfl.ch>
# -*- sh -*-

pkgname=av-98-offline
_pkgname='av-98'
pkgver=1.0.4dev
pkgrel=4
pkgdesc='Fork of the command-line gemini client AV-98 with added offline capabilities'
arch=(any)
url='https://tildegit.org/ploum/AV-98-offline'
license=('BSD')
depends=(
  'python'
  'python-magic'
)
makedepends=(
  'coreutils'
  'git'
  'python-setuptools'
)
optdepends=(
  'python-ansiwrap: support ANSI escape codes'
  'python-cryptography: better support of TOFU client certificates'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url/")
noextract=('AV-98-offline')
sha256sums=('SKIP')

build() {
  cd AV-98-offline || exit 1

  umask 0022
  python setup.py build
}

package() {
  cd AV-98-offline || exit 1

  umask 0022
  python setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
