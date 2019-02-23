# Maintainer: aecepoglu <aecepoglu@fastmail.fm>
pkgname=tpm-trivial
pkgver=1.3.2
pkgrel=1
pkgdesc="trivial-password-manager: a more feature-rich version of nmeum's tpm"
arch=('x86_64')
url="https://github.com/thexhr/tpm"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
provides=('tpm')
conflicts=('tpm')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/thexhr/tpm.git
_gitname=THE_GIT_REPO

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
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="" PREFIX="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
