# Maintainer: buzz <buzz-AT-l4m1-DOT-de>
pkgname=volctl
pkgver=0.3
pkgrel=1
pkgdesc="Per-application volume control for GNU/Linux desktops"
arch=("any")
url="https://buzz.github.io/volctl/"
license=("GPL")
groups=()
depends=("python2" "python2-gobject" "pulseaudio")
optdepends=("pavucontrol: mixer support")
makedepends=("git")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()

_gitroot="https://github.com/buzz/volctl.git"
_gitname="volctl"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
