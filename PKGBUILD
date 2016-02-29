# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>
pkgname=impacket-git
_gitname=impacket
pkgver=0.9.14.r1707.g79dda7f
pkgrel=1
pkgdesc="Collection of Python2 classes focused on providing access to network packets"
arch=('i686' 'x86_64')
url="http://corelabs.coresecurity.com/index.php?module=Wiki&action=view&type=tool&name=Impacket"
license=('APACHE')
depends=('python2' 'python2-crypto')
optdepends=('pcapy: traffic sniffing example programs')
makedepends=('sed')
source=("$_gitname::git+https://github.com/CoreSecurity/impacket.git")
sha512sums=('SKIP')
conflicts=('impacket')
provides=('impacket')

pkgver() {
	cd "$srcdir/$_gitname"
    printf "%s.r%s.g%s" "$(git describe --tags --always | awk -F '[-_]' '{ print $2 "." $3 "." $4 }')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/$_gitname"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 || return 1
  install -D LICENSE ${pkgdir}/usr/share/licenses/impacket/LICENSE
}

