# Maintainer: Nate Levesque <public@thenaterhood.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
# Source : new application - https://forums.insynchq.com

pkgname=insync
pkgver=3.3.9.40955
pkgrel=1
_dist=buster
pkgdesc="An unofficial Google Drive and OneDrive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('adobe-source-code-pro-fonts'
         'alsa-lib'
         'fontconfig'
         'glibc'
         'hicolor-icon-theme'
         'libglvnd'
         'nss'
         'xdg-utils')
optdepends=()
arch=('x86_64')
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}-${_dist}_amd64.deb"
    'insync@.service'
    'insync.service')
sha256sums=('c412cd1a46021ad44bff3ac7e9fdbdf983fa62952f9872a162867e41b40da09c'
            'cf276c1dbf1592ea63a21c2d61c75f7ad6ec3b13e87b3aaa331e9c14799f4598'
            '1432141539a6b3c5333631a2ee6696fab9bd2fe8770643bc670d95e4e96203e0')
package() {
   tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   install -Dm644 insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   install -Dm644 insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
   install -dm755  ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0
   ln -s /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
   rm ${pkgdir}/usr/lib/insync/lib{drm,GLX,GLdispatch}.so*
}
