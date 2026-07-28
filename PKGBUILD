# Maintainer: SocioProphet <dev@socioprophet.ai>
# AUR binary package: installs Noetica from the official release .deb (no local Tauri build).
# Publish by pushing this + .SRCINFO to ssh://aur@aur.archlinux.org/noetica-bin.git
# (needs an AUR account with an SSH key). Regenerate .SRCINFO with `makepkg --printsrcinfo`.
pkgname=noetica-bin
pkgver=0.4.24
pkgrel=1
pkgdesc="Governed, sovereign AI workstation — local-first, cites its sources, abstains instead of guessing"
arch=('x86_64')
url="https://socioprophet.ai"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
provides=('noetica')
conflicts=('noetica')
options=('!strip')
source=("https://github.com/SocioProphet/Noetica/releases/download/v${pkgver}/Noetica_${pkgver}_amd64.deb")
# sha256 of the v0.4.24 release deb (verified against the published artifact).
# On version bumps: updpkgsums  (or)  sha256sum Noetica_${pkgver}_amd64.deb
sha256sums=('3971e337e623b540fdc4073f8f9cd4080e82473e3730f042c104cc51b51bcb25')

package() {
  # Unpack the .deb payload into the package root.
  tar -xf data.tar.gz -C "${pkgdir}" 2>/dev/null \
    || bsdtar -xf "${srcdir}"/*.deb -C "${srcdir}" && tar -xf "${srcdir}/data.tar."* -C "${pkgdir}"
  # Ship the license where Arch expects it.
  install -Dm644 "${pkgdir}/usr/share/doc/noetica/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
