# Maintainer: Cameron Katri <katri.cameron@gmail.com>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: me at oguzkaganeren dot com dot tr
# Contributor: Rowisi < nomail <at> private <dot> com >

pkgname=vscodium-bin
_pkgname=VSCodium
pkgver=1.49.1
pkgrel=1
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=(
        fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss
        'glibc>=2.28-4'
        )
optdepends=(
        'gvfs: For move to trash functionality'
        'libdbusmenu-glib: For KDE global menu'
)
provides=('code')
conflicts=('code' 'vscode')

sha256sums=('65e6b053e6d8be61763801312ded64a82cf835d77a6eabe1b9d7eb9e87b2e49b')
source=('vscodium-bin.desktop')

sha256sums_x86_64=('e47a97b8038424cbe1f586034be7b2fb46c65fd010ef94727d7785f7831c6183')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.tar.gz")

sha256sums_armv7h=('6534d7b10b13a1effadf408899c90a23a8a499298d686a3e8e74535c186a6b65')
source_armv7h=("${pkgname}-${pkgver}.tar.gz::https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-arm-${pkgver}.tar.gz")

sha256sums_aarch64=('e9d8a5742454ef0ea27ce8b0675a77d8d06eb16638be2aaa20972abe19b15cf3')
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-arm64-${pkgver}.tar.gz")

shopt -s extglob

package() {
  install -d -m755 ${pkgdir}/usr/bin
  install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
  cp -r ${srcdir}/!(vscodium-bin.desktop|${pkgname}-${pkgver}.tar.gz) ${pkgdir}/usr/share/${pkgname}
  ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/code
  ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
  ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
  install -D -m644 ${srcdir}/vscodium-bin.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -D -m644 ${srcdir}/resources/app/resources/linux/code.png \
          ${pkgdir}/usr/share/pixmaps/vscodium.png
}
