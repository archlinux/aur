# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='offpunk-git'
_pkgname='offpunk'
pkgver='0.1.r0.gc294e4c'
pkgrel='1'
pkgdesc='Fork of the command-line Gemini client AV-98 with added offline capabilities'
arch=('any')
url='https://tildegit.org/ploum/AV-98-offline'
license=('BSD')
depends=('python')
makedepends=(
  'coreutils'
  'git'
  'python-setuptools'
)
optdepends=(
  'python-ansiwrap: support ANSI escape codes'
  'python-cryptography: better support of TOFU client certificates'
  'python-magic: useful to determine the MIME type of cached objects'
)
source=("git+$url/")
_gitname='AV-98-offline'
noextract=("$_gitname")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname" || exit 1

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "$_gitname" || exit 1

  umask 0022
  python setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
