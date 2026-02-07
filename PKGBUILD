pkgname=omcalc-git
pkgver=r0.0000000
pkgrel=3
pkgdesc='Minimal GTK4 calculator tuned for Omarchy/Hyprland workflows'
arch=('x86_64')
url='https://github.com/jadabreu/omcalc'
license=('MIT')
options=('!debug')
depends=('gjs' 'gtk4' 'libadwaita')
makedepends=('git')
provides=('omcalc')
conflicts=('omcalc')
source=(
  'omcalc-src::git+https://github.com/jadabreu/omcalc.git'
  'omcalc'
  'omcalc-clear-history'
  'omcalc.desktop'
)
sha256sums=(
  'SKIP'
  '5fffd1f8af61d0d70c2a4bad6f182f65e8f3dd6ed34cb2874af8503d92de9aad'
  '7f0bbcb05ad69c7cf05a90f42ebef466bf7d0680999a2f0348befa7a8bd4ff6e'
  '25ccf9df548cfe07d4e5cfdb76f9548bead10d2f61dd290af7cd6f68f12ea56a'
)

pkgver() {
  cd "${srcdir}/omcalc-src"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/omcalc-src"

  install -Dm755 app/gtk4/run.sh "${pkgdir}/usr/lib/omcalc/run.sh"
  install -Dm644 app/gtk4/omarchy_calc_ui.js "${pkgdir}/usr/lib/omcalc/omarchy_calc_ui.js"
  install -Dm644 app/gtk4/engine.js "${pkgdir}/usr/lib/omcalc/engine.js"
  install -Dm644 app/gtk4/omarchy_calc_ui.css "${pkgdir}/usr/lib/omcalc/omarchy_calc_ui.css"

  install -Dm644 app/gtk4/README.md "${pkgdir}/usr/share/doc/omcalc/README.md"
  install -Dm644 app/gtk4/hyprland-snippet.conf "${pkgdir}/usr/share/doc/omcalc/hyprland-snippet.conf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${srcdir}/omcalc" "${pkgdir}/usr/bin/omcalc"
  install -Dm755 "${srcdir}/omcalc-clear-history" "${pkgdir}/usr/bin/omcalc-clear-history"
  install -Dm644 "${srcdir}/omcalc.desktop" "${pkgdir}/usr/share/applications/omcalc.desktop"
}
