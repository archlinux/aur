# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

: ${_commit=a8f632dd0371d155b66a5f74526d56f63bcaa257} # 0.4.2.1.r12

_pkgname="archmage"
pkgname="$_pkgname"
pkgver=0.4.2.1
pkgrel=3
pkgdesc="An extensible reader and decompiler for files in the CHM format"
url="https://github.com/dottedmag/archmage"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  'elinks'
  'htmldoc'
  'python'
  'python-beautifulsoup4'
  'python-pychm'
  'python-setuptools'
  'python-sgmllib3k'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "archmage.1" -t "$pkgdir/usr/share/man/man1/"
}
