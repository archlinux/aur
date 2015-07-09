# Maintainer: John K. Luebs <jkl@johnluebs com>
# Contributor: Simon Gomizelj <https://github.com/vodik>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Douglas Meyer <Douglas.Meyer@mail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Alexander <iam.asm89@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/jkl1337/packages-archlinux.git

pkgname=hipchat
pkgver=2.2.1388
pkgrel=1
pkgdesc="Persistent group chat using XMPP"
arch=('i686' 'x86_64')
url="https://www.hipchat.com/linux"
license=('unknown')
depends=('qt5-base' 'libltdl' 'mesa' 'libxslt' 'hicolor-icon-theme'
         'libxcomposite' 'libpulse' 'gstreamer0.10' 'gstreamer0.10-base')
install='hipchat.install'
# remove pkg in basename to avoid confusing AUR helpers such as packer
source=(${pkgname}-${pkgver}-$CARCH.tar.xz::http://downloads.hipchat.com/linux/arch/$CARCH/${pkgname}-${pkgver}-$CARCH.pkg.tar.xz)

if [ "$CARCH" == "i686" ]; then
  sha1sums=('273a9abce4ac4cc6f3002657a50a38e2afa9e50a')

else
  sha1sums=('0f0ee7c25d85912b744f74c7ab85fa980e9a992e')
fi

package() {
  cp -R $srcdir/{opt,usr} "$pkgdir"

  # Fix for libstdc++
  # https://bbs.archlinux.org/viewtopic.php?id=181171
  # https://bugs.archlinux.org/task/40253
  # https://bbs.archlinux.org/viewtopic.php?pid=1413827
  ln -sf /usr/lib/libstdc++.so.6.0.20 $pkgdir/opt/HipChat/lib/libstdc++.so.6.0.18
}
