# Maintainer: edio <edio at archlinux dot us>

pkgname=systemd-kdemodules-git
pkgver=20130310
pkgrel=1
pkgdesc="systemd units to load KDE modules in your custom environment"
arch=('any')
url="https://github.com/edio/systemd-kdemodules"
license=('GPL3')
depends=('systemd' 'dbus' 'kdebase-runtime')
makedepends=('git')
install='systemd-kdemodules.install'

_gitroot="https://github.com/edio/systemd-kdemodules.git"
_gitname="systemd-kdemodules"

build () {
  cd "${srcdir}"

  msg "Connecting to the GIT server..."
  if [ -d ${_gitname} ] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
  msg "GIT checkout done."
}


package() {
  cd "${srcdir}"/${_gitname}
  install -d ${pkgdir}/usr/lib/systemd/user
  cp *.service ${pkgdir}/usr/lib/systemd/user/
  cp *.target ${pkgdir}/usr/lib/systemd/user/
}

# vim: ts=2 sw=2 et:
