# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

# missing ico and license file

pkgname=tor-messenger-bin
pkgver=0.1.0b3
pkgrel=1
pkgdesc="A cross-platform chat program that aims to be secure by default and sends all of its traffic over Tor"
arch=('i686' 'x86_64')
url="https://www.torproject.org/"
license=('MIT')
source_i686=("https://dist.torproject.org/tormessenger/0.1.0b3/tor-messenger-linux32-0.1.0b3_en-US.tar.xz")
source_x86_64=("https://dist.torproject.org/tormessenger/0.1.0b3/tor-messenger-linux64-0.1.0b3_en-US.tar.xz")
sha512sums_i686=('f901dc8b8754d1adf5352d4f70aee5d9fa5c971393db750b29a18311fbda6cc5a0d2ad73a3f2891dd410e91c0c081753e9bec54955e872ed4e272604d4b43673')
sha512sums_x86_64=('3084b55db0219336dccd9a5e48460acd0aa4b29cdbe4bfe16d238b5fd70866cdcc5849ef9952b6bd86a0f3d58a383442e5835dac1f14b6b93a5645a9b3feaa82')

prepare() {
  sed -ie 's|"\$(dirname "\$\*")"/Messenger|/opt/tor-messenger|g' "${srcdir}/tor-messenger/start-tor-messenger.desktop"
  sed -ie 's|Messenger/start-tor-messenger|tor-messenger/start-tor-messenger|g' "${srcdir}/tor-messenger/start-tor-messenger.desktop"
}

package() {
  cd ${srcdir}
  install -vd $pkgdir/opt/tor-messenger
  cp -ar "${srcdir}/tor-messenger/Messenger" "${pkgdir}/opt/tor-messenger"

  install -Dm644 "${srcdir}/tor-messenger/start-tor-messenger.desktop" "${pkgdir}/usr/share/applications/start-tor-messenger.desktop"
}
