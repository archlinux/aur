# Maintainer:  Israel Herraiz <isra@herraiz.org>
pkgname=geobases-git
pkgver=r3004.690ce9b
pkgrel=1
epoch=
pkgdesc="Tool and Python module to play with geographical and travel data, and some non-geographical data too."
arch=('i686' 'x86_64')
url="http://opentraveldata.github.com/geobases/"
license=('CCPL:by-sa-3.0.txt')
groups=()
depends=('python')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
ybackup=()
options=(!emptydirs)
install=
changelog=
source=('geobases::git+https://github.com/opentraveldata/geobases.git#branch=3000')
md5sums=('SKIP')

noextract=()
_gitroot=https://github.com/opentraveldata/geobases.git
_gitname=geobases

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin public
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
  cd "$srcdir/$_gitname"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
