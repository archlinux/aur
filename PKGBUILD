# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>
# Contributors:

pkgname=network-manager-wireguard-git
_gitname='network-manager-wireguard'
pkgver=1
pkgrel=1
pkgdesc='NetworkManager VPN Plugin: Wireguard '
arch=('x86_64')
url='https://github.com/max-moser/network-manager-wireguard'
license=('GPLv2')
conflicts=('network-manager-wireguard')
depends=('networkmanager' 'libnm' 'libnm-glib' 'intltool')

source=("git+https://github.com/max-moser/${_gitname}.git" "nm-wireguard-service.name")

sha256sums=('SKIP' '020a805b88d0129d129ca43a990f2f3ca02d33afa76f978a8174eb82ff046ca0')

build() {
  cd $_gitname
  ./autogen.sh
  make
}

package() {
  mkdir -p "${pkgdir}/usr/lib/NetworkManager/VPN/"
  install -Dm644 "${srcdir}/nm-wireguard-service.name" "${pkgdir}/usr/lib/NetworkManager/VPN/"
  cd ${srcdir}/$_gitname/
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  make DESTDIR="$pkgdir/" sysconfdir="$pkgdir/etc" libdir="$pkgdir/usr/lib" install
}

