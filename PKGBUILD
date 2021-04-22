# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Nate Levesque <public@thenaterhood.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-headless
pkgver=3.1.1.10625
pkgrel=1
pkgdesc="Google Drive and OneDrive headless client for servers"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('glibc')
arch=('x86_64')
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}-buster_amd64.deb"
        'insync-headless.service'
        'insync-headless@.service'
        'insync-headless.patch')
sha256sums=('220bb6f589d6f253c4b6af79ca49372bb01489afe629a321cc20bb7debacd168'
            '3812fee60e45e3227446328758cc4c690461b674c8fd27677ba985c635e6147d'
            'e35c8274083a04adbbc96330958f18183e169348917c6e86e69e7d71ff644e4b'
            '67a54a59f0a7c747cb9ec8913b90a6bf1ed4e4b4c2ece2e2cd27d212546a93ed')
package() {
   tar -xf data.tar.gz

   # insync conflict workaround
   mv usr/lib/insync usr/lib/insync-headless
   patch -Np1 -i insync-headless.patch
   rm -r usr/share/icons

   cp -r usr "${pkgdir}"/usr

   install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ insync-headless@.service
   install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user/ insync-headless.service
}
