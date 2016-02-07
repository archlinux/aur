# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: 1213 <lambertacampo at gmail dot com>
pkgname=exaile-git
pkgver=3.4.5
pkgrel=1
pkgdesc="music player for gnome, similar to KDEs amarok"
arch=('any')
url="www.exaile.org"
license=('GPL')
groups=()
depends=(
  'python2>=2.7.0' 
  'gtk3>=3.10' 
  'gstreamer>=1.4' 
  'mutagen>=1.10' 
  'dbus-python'
  'pygobject-devel>=3.13.2'
  'python-cairo')

makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/exaile/exaile.git"
_gitname=exaile

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

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
