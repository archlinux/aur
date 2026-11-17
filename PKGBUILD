# Maintainer: Davi <contato@davi.zip>
pkgname=clubin-bin
pkgver=0.2.31
_build=33
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
sha256sums=('1bd781c132ae88e52d00e71f514ef30a22bf2b997e052e6bac2385b90c89c25c')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  rm -rf "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/clubin/clubin "$pkgdir/usr/bin/clubin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir"/usr/share/doc/clubin/EULA.* "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir/usr/share/doc"
}
