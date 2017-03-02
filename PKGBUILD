# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=rainbow-git
pkgver=20111119
pkgrel=1
pkgdesc="Colorize commands output or STDIN using patterns."
arch=(any)
url="https://github.com/nicoulaj/rainbow"
license=(GPL3)
depends=(python)
changelog=Changelog
provides=(rainbow)
conflicts=(rainbow)

_gitroot=git://github.com/nicoulaj/rainbow.git
_gitname=${pkgname}

build() {
  msg2 "Connecting to GIT server...."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    ( cd "${srcdir}/${_gitname}" && git pull origin )
    msg2 "The local files are updated."
  else
    git clone $_gitroot "${srcdir}/${_gitname}"
  fi
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
