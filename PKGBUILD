# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>

pkgname=guacamelee-hib
pkgver=1393037377
pkgrel=1
pkgdesc="A dia de los muertos-themed platform fighter"
arch=('i686' 'x86_64')
url="http://guacamelee.com/"
license=('custom:commercial')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="Guacamelee_linux_${pkgver}.sh"
PKGEXT=".pkg.tar"

source=("hib://$_gamepkg"
	"guacamelee.desktop")

sha512sums=('e52c4099e15f20df6512c3c9617cbf29f5ea428c117a0520ce57bacf99b7d33ace6a04c811fd9ced63b7ba11a3a79549b93f83fd18e42ca9a1366aeb4114cd87'
            'f3863f252bb7a94db8da4e14dacb325b4e84628d404a6cf6c51a097c640481dc328c4eb9c875ff5fd6acd6acb5c608b2d7f54bb06fbb87b1508811dd3f3161bb')

package() {
	mkdir -p ${pkgdir}/{opt/guacamelee,usr/{bin,share/applications}}
	mv ${srcdir}/data/{x86,noarch}/* ${pkgdir}/opt/guacamelee/
	echo "#!/bin/bash
cd /opt/guacamelee
./game" > ${pkgdir}/usr/bin/guacamelee
	chmod a+x ${pkgdir}/usr/bin/guacamelee
	mv ${source[1]} "${pkgdir}"/usr/share/applications/
}
