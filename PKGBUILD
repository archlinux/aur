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
  'f0c3d37b3ee278490488b4158c583981c96407ddc666871b4402edc21e0f6c53'
  'a384f0c1ea3613a23d84f25dca56b52a34b3b822158f03cc7783e4dcd4230b8c'
  '9ffec3532ffeba913cdd92722713fbf1d3ef5cd8632f680e95f251a7769287e1'
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
