# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vmtouch-systemd-git
pkgver=1.1
pkgrel=1
pkgdesc='Systemd support for vmtouch.'
arch=('any')
url='https://github.com/dracorp/vmtouch-systemd'
license=('GPL')
groups=()
depends=(bash libui-sh vmtouch)
makedepends=(git)
provides=(vmtouch-systemd)
conflicts=(vmtouch-systemd)
backup=(
etc/vmtouch.conf
etc/default/vmtouch
)
_gitroot='https://github.com/dracorp/vmtouch-systemd.git'
_gitname='vmtouch-systemd'

pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}
build(){
  cd "$srcdir"
  msg2 "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd $_gitname
    git pull --depth 1 origin
    msg2 "The local files are updated."
  else
    git clone --depth 1 $_gitroot $_gitname
    cd $_gitname
  fi

  msg2 "GIT checkout done or server timeout"
}
package(){
  cd "$srcdir"/$_gitname

  make DESTDIR="$pkgdir" install

#  install -Dm755 vmtouch.sh "$pkgdir"/usr/lib/systemd/scripts/vmtouch
#  install -Dm644 vmtouch.service "$pkgdir"/usr/lib/systemd/system/vmtouch.service
#  install -Dm644 vmtouch.default "$pkgdir"/etc/default/vmtouch
#  install -Dm644 vmtouch.conf "$pkgdir"/etc/vmtouch.conf

}

