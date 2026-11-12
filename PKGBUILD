# Maintainer: AceRound <support@aceround.app>
#
# AceRound Auto Apply is closed source. Release CI builds the official .deb and uploads it
# to dl.aceround.app; this -bin package repackages that .deb.
#
# pkgver and sha256sums are rewritten and pushed to the AUR by the release workflow
# (publish-aur-oversea in .github/workflows/apply-release.yml). Do not edit them by hand.
pkgname=aceround-apply-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="AceRound Auto Apply — AI job applications on company career sites, in your own browser, with every step visible"
arch=('x86_64')
url="https://www.aceround.app/auto-apply"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('aceround-apply')
conflicts=('aceround-apply')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("aceround-apply-${pkgver}-amd64.deb::https://dl.aceround.app/apply/aceround-apply-${pkgver}-amd64.deb")
noextract=("aceround-apply-${pkgver}-amd64.deb")
sha256sums=('b433761875091b49b93c78678267c825fc87d39383c49427b2fdb2308c77d69f')

package() {
  cd "$srcdir"
  bsdtar -xf "aceround-apply-${pkgver}-amd64.deb"
  bsdtar -xf data.tar.*

  install -Dm755 "usr/bin/aceround-apply" "$pkgdir/usr/bin/aceround-apply"
  install -Dm644 "usr/share/applications/aceround-apply.desktop" \
    "$pkgdir/usr/share/applications/aceround-apply.desktop"

  for icon in usr/share/icons/hicolor/*/apps/aceround-apply.png; do
    [[ -e "$icon" ]] || continue
    install -Dm644 "$icon" "$pkgdir/$icon"
  done
}
