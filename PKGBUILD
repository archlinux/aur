# Maintainer: jose1711 <jose1711@gmail.com>
# Contributor: dimytch

pkgname=gkrellm2-multiping
pkgver=2.0.15
pkgrel=2
pkgdesc="Pings several machines and shows the current round-trip and status."
arch=('i686' 'x86_64')
url="http://members.dslextreme.com/users/billw/gkrellm/Plugins.html"
license=('GPL')
depends=('gkrellm')
makedepends=('git')
_gitroot="https://github.com/jmakovicka/gkrellm-multiping.git"
_gitname="gkrellm-multiping"

build() {
cd ${srcdir}
if [ -d $_gitname ] ; then
( cd $_gitname && git pull origin )
msg "The local files are updated."
else
git clone $_gitroot $_gitname
fi
cd ${_gitname}
sed -i -e "/^INSTALLROOT/s/\/local//g" -e "s/ -Wl / /" Makefile
make
}

package() {
cd ${srcdir}/${_gitname}
install -D -c -s -m 644 multiping.so $pkgdir/usr/lib/gkrellm2/plugins/multiping.so
install -D -c -s -m 4755 pinger $pkgdir/usr/lib/gkrellm2/exec/pinger
}
