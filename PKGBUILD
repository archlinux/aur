pkgname=mini-os-helper-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="GTK4 system helper dashboard with quick actions and notes"
arch=('any')
url="https://github.com/EvansOgala/mini-os-helper"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'xdg-utils'
  'python-psutil'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/EvansOgala/mini-os-helper.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/mini-os-helper"
  install -Dm644 main.py "$pkgdir/usr/lib/mini-os-helper/main.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/mini-os-helper/ui.py"
  install -Dm644 gtk_style.py "$pkgdir/usr/lib/mini-os-helper/gtk_style.py"
  install -Dm644 settings.py "$pkgdir/usr/lib/mini-os-helper/settings.py"
  install -Dm644 quick_actions.py "$pkgdir/usr/lib/mini-os-helper/quick_actions.py"
  install -Dm644 system_info.py "$pkgdir/usr/lib/mini-os-helper/system_info.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/org.evans.MiniOSHelper" <<'LAUNCHER'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/mini-os-helper/main.py "$@"
LAUNCHER

  install -Dm644 org.evans.MiniOSHelper.desktop \
    "$pkgdir/usr/share/applications/org.evans.MiniOSHelper.desktop"
  install -Dm644 org.evans.MiniOSHelper.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.evans.MiniOSHelper.metainfo.xml"
  install -Dm644 org.evans.MiniOSHelper.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.evans.MiniOSHelper.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
