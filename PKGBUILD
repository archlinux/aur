# HUSHHQ-35. AUR `hush-desktop-bin` PKGBUILD template.
# Maintainer: Hush <security@gethush.live>
pkgname=hush-desktop-bin
pkgver=0.1.46
pkgrel=1
pkgdesc="End-to-end encrypted messenger (binary release)"
arch=('x86_64')
url="https://gethush.live"
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'libxss' 'libnotify')
optdepends=(
  'libsecret: keychain integration'
  'gnome-keyring: secret storage backend'
)
provides=('hush')
conflicts=('hush')
source=("${pkgname}-${pkgver}.deb::https://github.com/hushhq/hush-desktop/releases/download/v${pkgver}-mvp/hush-desktop_${pkgver}-mvp_amd64.deb")
sha256sums=('c060bb5bc20692e3fa5b8444d20038389dbe9311213d1eafbdb54325c5c7e595')
noextract=("${pkgname}-${pkgver}.deb")

package() {
  cd "${srcdir}"
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.xz -C "${pkgdir}" || bsdtar -xf data.tar.zst -C "${pkgdir}"
  # `dpkg-deb` would be cleaner but is not standard on Arch installs.
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgdir}/usr/share/doc/hush/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
