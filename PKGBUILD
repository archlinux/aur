# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Nate Levesque <public@thenaterhood.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-headless
pkgver=3.0.1.10590
pkgrel=1
pkgdesc="Google Drive and OneDrive headless client for servers"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('cron'
         'glibc')
conflicts=('insync')
arch=('x86_64')
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}-buster_amd64.deb"
        'insync-headless@.service'
        'insync-headless.service'
        'insync-headless.patch')
sha256sums=('9634acffaa0666070c52f6ec9486444b875570d0d83a2017c4e69eba86944a4c'
            'b8dd2876fc0aa2eb75081fe5f819f544029627c4bcdbbd4b829da8b46b5dcc46'
            '1f84e70294a6f242fa7a32a3508e1d43c36dd0f89f675d324cc104dd28ffaa18'
            '67a54a59f0a7c747cb9ec8913b90a6bf1ed4e4b4c2ece2e2cd27d212546a93ed')
package() {
   tar -xf data.tar.gz

   install -dm755 "${pkgdir}"/usr/{bin,lib}

   cp -r usr/share "${pkgdir}"/usr/
   #cp -r usr/lib/insync "${pkgdir}"/usr/lib/insync-headless
   cp -r usr/lib/insync "${pkgdir}"/usr/lib/insync

   #patch -Np1 -i insync-headless.patch
   install -Dm755 -t "${pkgdir}"/usr/bin/ usr/bin/insync-headless

   install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ insync-headless@.service
   install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user/ insync-headless.service
}
