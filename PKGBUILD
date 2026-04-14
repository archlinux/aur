# Maintained automatically from OneNoted/taskers
pkgname=taskers-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Agent-first terminal workspace (published Linux bundle)'
arch=('x86_64')
url='https://github.com/OneNoted/taskers'
license=('MIT')
depends=('glibc' 'gtk4' 'libadwaita' 'webkitgtk-6.0')
optdepends=(
  'niri: focus an existing Taskers window from desktop launches'
  'xdg-desktop-portal-gtk: improve desktop portal support'
)
conflicts=('taskers' 'taskers-git')
provides=('taskers')
source=(
  'taskers-linux-bundle-v0.7.0-x86_64-unknown-linux-gnu.tar.xz::https://github.com/OneNoted/taskers/releases/download/v0.7.0/taskers-linux-bundle-v0.7.0-x86_64-unknown-linux-gnu.tar.xz'
  'taskers-entrypoint.sh'
  'dev.taskers.app.desktop'
  'taskers.svg'
  'LICENSE'
)
sha256sums=(
  '59f5fa0d56120b659473152d447c8d6a8664684be2572cdeab4fca7322d0d8fc'
  '83c76f0c92d4c1a2f13e70fb1f18da089a01726ecbb2b7a67bae9ad0a677778b'
  '2902765627b7976f589ea4edf50f2468b45900225197b452e70f9bbae4eaa476'
  '019a8646c7b6b93cb375ca012e5e8cf615f2d6b164f404e8b2a99b0d7d1a2936'
  'b0dde23d2f2c9d247848720ae985ef83e40d4eeb6b2b6b662423a1bad390019b'
)

package() {
  install -dm755 "$pkgdir/opt/taskers" "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
    "$pkgdir/usr/share/licenses/${pkgname}"

  cp -a "$srcdir/bin" "$pkgdir/opt/taskers/"
  cp -a "$srcdir/ghostty" "$pkgdir/opt/taskers/"
  cp -a "$srcdir/terminfo" "$pkgdir/opt/taskers/"

  for bin in taskers taskersctl taskers-terminald; do
    install -m755 "$srcdir/taskers-entrypoint.sh" "$pkgdir/usr/bin/$bin"
  done

  install -m644 "$srcdir/dev.taskers.app.desktop" \
    "$pkgdir/usr/share/applications/dev.taskers.app.desktop"
  install -m644 "$srcdir/taskers.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/taskers.svg"
  install -m644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
