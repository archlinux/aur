# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=soundhive-bin
_appname=SoundHive
pkgver=1.3.0
pkgrel=1
pkgdesc='Fast browser for large sound effect libraries: search, audition, tag and drag sounds (prebuilt binary)'
arch=('x86_64')
url='https://github.com/BorisBrock/SoundHive'
license=('MIT')
depends=('alsa-lib' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'webkit2gtk-4.1')
provides=('soundhive')
conflicts=('soundhive')
# Ship the released binary as it is
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_appname}_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/BorisBrock/SoundHive/v$pkgver/LICENSE")
sha256sums=('71234811a0483ca7dfd2999dba764b93e01a632b4daa13c903d80b520a5466a3'
            '90bc9218c32fb04e7384d8acbbeac4ea255d0823d3c53fec70a3b6679ef604ae')

package() {
  # makepkg has already unpacked the .deb; its data archive holds the /usr tree
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
