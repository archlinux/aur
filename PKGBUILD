# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Peter Cai <peter at typeblog dot net>
# Contributor: Mike Tong <3344907598 [AT] qq.com>

# ref:
#   https://github.com/archlinuxcn/repo/pull/1260
#   https://github.com/laomocode/netease-cloud-music
#   https://github.com/ZetaoYang/netease-cloud-music-appimage
#   http://mirrors.ustc.edu.cn/deepin/pool/main/n/netease-cloud-music/
#   https://blog.eh5.me/fix-ncm-flac-playing/

pkgname=netease-cloud-music-imflacfix
pkgver=1.2.1
pkgrel=1
pkgdesc='Netease Cloud Music, converted from .deb package, with IBus input method and online SQ support'
arch=(x86_64)
url='http://music.163.com'
license=(custom GPL2)
depends=(gtk2)
provides=('netease-cloud-music')
conflicts=('netease-cloud-music')
source=(
  'http://music.163.com/html/web2/service.html'
  "https://alspace.glitch.me/%E8%BD%AF%E4%BB%B6/netease-cloud-music_vlc_${pkgver}_amd64.deb"
)
sha256sums=('cf307fee4be224223ed8cf5af5e8708960683564cd05c53108fa3c382c029a0e'
            '7e5fb2efe724c1ef0d2d668c81248a7d56bada75f2b9787a7705d6b36bee81a0')

# https://wiki.archlinux.org/index.php/Nonfree_applications_package_guidelines#Custom_DLAGENTS
#DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  cd ${srcdir}
  _optdir='opt/netease/netease-cloud-music'
  bsdtar  -Jxf data.tar.xz -C ${pkgdir} \
          --exclude="${_optdir}/libs/vlc/" \
          --exclude="${_optdir}/libs/libvlc*" \
          --exclude="${_optdir}/vlc-patching/usr/bin/" \
          --exclude="${_optdir}/vlc-patching/usr/include/" \
          --exclude="${_optdir}/vlc-patching/usr/lib/pkgconfig/" \
          --exclude="${_optdir}/vlc-patching/usr/lib/vlc/lua/" \
          --exclude="${_optdir}/vlc-patching/usr/share/" \
          --exclude="${_optdir}/libs/libgdk-x11-2.0.so.0" \
          --exclude="${_optdir}/libs/libgtk-x11-2.0.so.0" \

  chown -R root:root ${pkgdir}
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
