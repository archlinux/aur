# Maintainer: Davi <contato@davi.zip>
pkgname=clubin-bin
pkgver=0.2.28
_build=30
pkgrel=1
pkgdesc='Voice, video and screen sharing chat for groups (beta, invite only)'
arch=('x86_64')
url='https://clubin.chat'
license=('LicenseRef-Clubin-EULA')
depends=('gtk3' 'glib2' 'gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good'
         'mesa' 'libglvnd' 'gcc-libs' 'glibc' 'xdg-utils')
optdepends=('gst-plugin-pipewire: PipeWire audio'
            'gst-plugins-bad: extra codecs')
provides=('clubin')
conflicts=('clubin')
options=('!strip' '!debug')
source=("clubin-${pkgver}+${_build}.deb::https://dl.clubin.chat/stable/linux-x64/clubin-${pkgver}+${_build}-linux-x64.deb")
sha256sums=('e31639d2db51a38b621c84f7538672ccc28a82bc532b681a51281712231c8194')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  rm -rf "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/clubin/clubin "$pkgdir/usr/bin/clubin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir"/usr/share/doc/clubin/EULA.* "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir/usr/share/doc"
}
