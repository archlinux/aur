# Maintainer: Vianney le Clément <vleclement AT gmail · com>
pkgname=python-supergenpass-git
pkgver=20130209
pkgrel=1
pkgdesc="SuperGenPass Python module and GTK interface"
arch=(any)
url="https://bitbucket.org/vianney/python-supergenpass"
license=('GPL3')
depends=('python')
makedepends=('git')
optdepends=('gtk3: for GTK interface'
            'python-gobject: for GTK interface')

_gitroot=https://bitbucket.org/vianney/python-supergenpass.git
_gitname=python-supergenpass

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:
