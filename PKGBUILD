# Maintainer: numbpill3d <numbpilled2133@users.noreply.github.com>
pkgname=paradex-git
_pkgname=paradex
pkgver=r6.0a7c1e1
pkgrel=1
pkgdesc="Retro-mac terminal widget for cataloguing aesthetics/moods and rolling concept seeds"
arch=('any')
url="https://github.com/numbpill3d/paradex"
license=('MIT')
depends=('python' 'tk')
makedepends=('git')
provides=('paradex')
conflicts=('paradex')
source=("$_pkgname::git+https://github.com/numbpill3d/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -Dm755 paradex "$pkgdir/usr/bin/paradex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/paradex.desktop "$pkgdir/usr/share/applications/paradex.desktop"

  for sz in 32 48 64 128 256; do
    install -Dm644 "packaging/icons/paradex-${sz}.png" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/paradex.png"
  done
}
