# Maintainer: Quint Guvernator <quint@guvernator.net>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Roel Gerrits <roel@roelgerrits.nl>
pkgname=nodm-dgw
pkgver=0.13
pkgrel=1
pkgdesc="X display manager for automatic logins, dgw's fork to fix restarting issue"
arch=('x86_64')
url='https://github.com/spanezz/nodm/pull/13'
license=('GPL')
depends=('pam' 'xorg-xinit')
makedepends=('help2man')
backup=('etc/nodm.conf')
provides=('nodm')
conflicts=('nodm')
_fork_branch=10-rebase
source=("https://github.com/dgw/nodm/archive/${_fork_branch}.tar.gz"
     	"nodm.conf"
     	"nodm.service")
sha512sums=('87202c0c3dac8c1fd28cdbc9d2f45d7e03429a015a987e97d044c8d60319a21bbe2d7dc5b13158078fd878b1ee79e5bbc2e2788e3c98931ca0572193ee3c3bef'
            '3da879a9362bf514b8ae9fbeb586489f203f1aff538162074e8b8bdd148a813f2a5d9f187a4396221c5a2b6b1dd44e3d11d43911b7a8220fe0682e0dec3b248f'
            '21214122072daec9c373c99d1c9c0898f58a277f90fab085b417989c62e6cf268fb52148f76ec12b9be23137af05059f37f901e3d54f49e6024a05fa75277381')

build() {
	cd "${srcdir}/nodm-${_fork_branch}"

    ./autogen.sh
	./configure --prefix=/usr/
	make
}

package() {
	cd "${srcdir}/nodm-${_fork_branch}"

	install -Dm755 nodm ${pkgdir}/usr/bin/nodm
	install -Dm644 ../nodm.conf ${pkgdir}/etc/nodm.conf
	install -Dm644 ../nodm.service ${pkgdir}/usr/lib/systemd/system/nodm.service
}
