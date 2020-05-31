# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Peter Cai <peter at typeblog dot net>
# Contributor: Mike Tong <3344907598 [AT] qq.com>

# ref:
#   https://github.com/archlinuxcn/repo/pull/1260
#   https://github.com/laomocode/netease-cloud-music
#   https://github.com/ZetaoYang/netease-cloud-music-appimage

pkgname=netease-cloud-music-imfix
pkgver=1.2.1
_pkgdate=20190428
pkgrel=1
pkgdesc="Netease Cloud Music, converted from .deb package, with IBus input method support"
arch=("x86_64")
url="http://music.163.com/"
license=('custom')
depends=('qcef' 'vlc')
provides=('netease-cloud-music')
conflicts=('netease-cloud-music')
source=(
    "http://d1.music.126.net/dmusic/netease-cloud-music_${pkgver}_amd64_ubuntu_${_pkgdate}.deb"
    "http://music.163.com/html/web2/service.html"
)
sha256sums=('1ee9f02842e6c2c8c79c48b2e932074f9c213a8eb4238e5e63f20438562fecbb'
            'cf307fee4be224223ed8cf5af5e8708960683564cd05c53108fa3c382c029a0e')

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz
  install -d ${pkgdir}/opt/netease/netease-cloud-music
  cp ${srcdir}/opt/netease/netease-cloud-music/netease-cloud-music ${pkgdir}/opt/netease/netease-cloud-music
  cp ${srcdir}/opt/netease/netease-cloud-music/netease-cloud-music.bash ${pkgdir}/opt/netease/netease-cloud-music
  cp -r ${srcdir}/usr ${pkgdir}
  sed -i "3,5d" ${pkgdir}/opt/netease/netease-cloud-music/netease-cloud-music.bash
  sed -i "2a\export XDG_CURRENT_DESKTOP=DDE" ${pkgdir}/opt/netease/netease-cloud-music/netease-cloud-music.bash
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
