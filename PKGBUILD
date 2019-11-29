# Maintainer: Nate Levesque <public@thenaterhood.com>
# Co-maintainer : Erik Dubois <erik.dubois@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
# Source : new application - https://forums.insynchq.com

pkgname=insync
pkgver=3.0.25.40643
pkgrel=1
_dist=buster
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('xdg-utils'
         'glibc'
         'python2'
         'libglvnd'
         'nss'
         'libxcursor'
         'libxi'
         'libxtst'
         'libxrandr'
         'alsa-lib'
         'libxcomposite')
optdepends=()
arch=('x86_64')
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}-${_dist}_amd64.deb"
    'insync@.service'
    'insync.service')
sha256sums=('da0fb1123e912cdc22d39a5803b421dd1559a59f1eb1d2263de3da8fa9f8ef03'
            'cf276c1dbf1592ea63a21c2d61c75f7ad6ec3b13e87b3aaa331e9c14799f4598'
            '1432141539a6b3c5333631a2ee6696fab9bd2fe8770643bc670d95e4e96203e0')
package() {
   tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   install -Dm644 insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   install -Dm644 insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
   install -dm755  ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0
   ln -s /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
}
