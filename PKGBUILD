# Maintainer: Xu FaSheng <fasheng.xu@gmail.com>

pkgname=pkgbuildup-git
pkgver=20131218
pkgrel=1
pkgdesc="A helper tool for AUR package maintainer to automatic update PKGBUILD files - Git version"
arch=(any)
url="https://github.com/fasheng/pkgbuildup"
license=(GPL3)
conflicts=()
provides=(pkgbuildup)
makedepends=('git')

_gitroot="https://github.com/fasheng/pkgbuildup.git"
_gitname="pkgbuildup"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout."
}

package() {
  msg "Starting install..."
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
