# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=xchat-se
pkgver=1.2.21
pkgrel=4
pkgdesc="An xchat fork with a few different features"
arch=('x86_64')
url="https://xchat.servx.org/"
options=('!strip')
provides=("xchat")
conflicts=('xchat')
source=('https://xchat.servx.org/linux/x86_64/linuxmint/stable/18/xchat-se_1.2.21-1_amd64.deb'
        'xchat-se.install')
md5sums=('16ef377b9e708a89968edf80f35c52ea'
         '8de528b549f6fffa56fb492162faed63')

depends=('gtk2'
         'openssl-1.0'
         'dbus-glib'
         'libnotify')
optdepends=('enchant: for spell checking support'
            'perl: for perl plugin'
            'tcl: for tcl plugin'
            'python2: for python plugin')

package() {
  cd "${pkgdir}"

  bsdtar xf "${srcdir}/data.tar.xz"

  # Move pkgconfig to proper location
  mv "usr/lib/x86_64-linux-gnu/pkgconfig" "usr/lib/pkgconfig"
  # We leave the xchat/plugins folder where it is
  # because the path is hard-coded in the xchat binary

  # Remove extra keywords line from desktop file
  # We probably don't need this any more but I'm gonna leave it here anyway ~MK
  sed -i '0,/^Keywords=.\+/! {/^Keywords=.\+/d}' "usr/share/applications/xchat.desktop"
}
