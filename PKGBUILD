# Maintainer: none
# Contributor: tarball <bootctl@gmail.com>

pkgname=etesync-knotes
pkgver=1.1
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64')
url='https://gitlab.com/JBeaumont81/Etesync-Knotes'
pkgdesc='Secure note-taking application with Etebase for encrypted synchronization'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libsecret'
  'openssl'
  'qt6-base'
)
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/Etesync-Knotes-v$pkgver.tar.gz")
sha256sums=('41fae45c771286a5938dc7dad9885f65bc5dc2cc681d52a6aa673193b30527c9')

build() {
  cd Etesync-Knotes-v$pkgver
  make
}

package() {
  cd Etesync-Knotes-v$pkgver

  make PREFIX="$pkgdir/usr" install

  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"

  cd "$pkgdir/usr/lib"
  ln -sf libetebase.so libetebase.so.0
}
