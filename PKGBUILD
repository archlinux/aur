# Maintainer: Xhelliom
pkgname=aurveto-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Security gate for AUR updates: delay, whitelist, static scan and AI review of the PKGBUILD diff (precompiled binaries)"
arch=('x86_64')
url="https://github.com/Xhelliom/aurveto"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gcc-libs' 'glibc')
provides=('aurveto')
conflicts=('aurveto')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/aurveto-x86_64-linux.tar.gz")
sha256sums=('cd2c4d8bd038175c0268968966d990631a312060aa743913eda02e322742a683')

package() {
  install -Dm755 aurveto     "$pkgdir/usr/bin/aurveto"
  install -Dm755 aurveto-gui "$pkgdir/usr/bin/aurveto-gui"

  install -Dm644 fr.xhelliom.AurVeto.desktop \
    "$pkgdir/usr/share/applications/fr.xhelliom.AurVeto.desktop"
  install -Dm644 fr.xhelliom.AurVeto.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/fr.xhelliom.AurVeto.svg"

  # Translation catalogs, precompiled in CI (see .github/workflows/release.yml).
  for mo in locale/*/aurveto.mo; do
    lang="$(basename "$(dirname "$mo")")"
    install -Dm644 "$mo" "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/aurveto.mo"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
