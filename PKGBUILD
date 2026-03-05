# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: tarball <bootctl@gmail.com>

pkgname=etesync-knotes
pkgver=2.0
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64')
url='https://codeberg.org/Josselin_Beaumont/Etesync-Knotes'
pkgdesc='Secure Etesync note-taking application with Etebase for encrypted synchronization'
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
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('03ed5dc7bb19991924779ba6226dc66179973e62938b136e3ddfd7dd878a5560ae5dc232791e85689be1224bc3469512aeabe06962437942ca0e21af21dfe2f3')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make PREFIX="$pkgdir/usr" install

  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
