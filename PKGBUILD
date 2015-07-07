# Maintainer: Olivier Biesmans <o.aurlinux@biesmans.fr>

pkgname=python-tellcore-py-git
pkgver=20130810
pkgrel=1
pkgdesc="Python wrapper for Telldus' home automation library."
arch=('any')
url="https://pypi.python.org/pypi/tellcore-py"
license=('GPL3')
groups=('devel')
depends=('python')
makedepends=('python' 'git')
provides=()
conflicts=('python-tellcore-py')
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
_gitroot='https://github.com/erijo/tellcore-py.git'
_gitname=tellcore-py

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
