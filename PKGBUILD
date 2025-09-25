# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

pkgname=chaptereditor
pkgver=1.45
pkgrel=1
pkgdesc='An extended chapter editor for Matroska (and other formats)'
arch=(x86_64)
url=https://forum.doom9.org/showthread.php?t=169984
license=()
depends=()
makedepends=(7zip)
source=(
  $pkgname-v$pkgver.7z::"https://forum.videohelp.com/attachments/82994-1729438370/cE-L($pkgver).7z"
  $pkgname.desktop
)
noextract=($pkgname-v$pkgver.7z)
sha256sums=(
  48376561163ae096190d2ae7cb52ea00f77a71aab0f7525c16e65326c3c82478
  39478e0d50a6dcf815e74e3649cd44a5b8dcbc51c4e1f3860298054f41dc1c82
)

prepare() {
  7z x $pkgname-v$pkgver.7z -o$pkgname-v$pkgver > /dev/null
}

package() {
  _name=chapterEditor
  install -dm755 "$pkgdir"/opt
  cp -r $pkgname-v$pkgver "$pkgdir"/opt/$_name
  install -Dm666 /dev/null "$pkgdir"/opt/$_name/$_name.ini # problematic: config shared between users
  install -dm755 "$pkgdir"/usr/bin
  ln -s /opt/$_name/$_name "$pkgdir"/usr/bin/$_name
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  for _size in 32 16; do
    install -Dm644 $pkgname-v$pkgver/Ico/cE_$_size.png "$pkgdir"/usr/share/icons/hicolor/${_size}x$_size/apps/$pkgname.png
  done
}
