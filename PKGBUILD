# Maintainer: Carlos Franke <carlos_franke at lemtank dot de>

pkgname=autosshfs-git
_gitname=$pkgname
pkgver=c9dc8cd
pkgrel=1
pkgdesc="Per user SSHFS automount using user's SSH configuration"
arch=('any')
url="https://github.com/hellekin/autosshfs"
license=('AGPL')
depends=('autofs' 'keychain' 'sshfs' 'x11-ssh-askpass')
makedepends=('git')
install="autosshfs.install"
#source=("$_gitname::git://github.com/korakinos/autosshfs.git")
source=("$_gitname::git://github.com/hellekin/autosshfs.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname/src
  PREFIX="/usr" make -e
}

package() {
  cd $_gitname
  PREFIX="${pkgdir}/usr"
  mkdir -p ${PREFIX}/bin/ ${PREFIX}/share/doc/autosshfs/
  install -D -o root -g root     -m 0750 src/autosshfs-user ${PREFIX}/bin/
	install -D -o root -g root -m 0750 src/autosshfs-map  ${PREFIX}/bin/ #group will be changed to autosshfs in install file
	install -D -o root -g root -m 0750 src/autosshfs-ssh  ${PREFIX}/bin/ #group will be changed to autosshfs in install file
	install -D -o root -g root     -m 0755 bin/keychain-ring  ${PREFIX}/bin/
	install -D -o root -g root     -m 0755 -d ${PREFIX}/share/doc/autosshfs/
	install -D -o root -g root     -m 0644 doc/* ${PREFIX}/share/doc/autosshfs
}

# vim:set ts=2 sw=2 et:
