# Maintainer: Cameron Katri <katri.cameron@gmail.com>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: me at oguzkaganeren dot com dot tr
# Contributor: Rowisi < nomail <at> private <dot> com >

pkgname=vscodium-bin
_pkgname=VSCodium
pkgver=1.52.0
pkgrel=2
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

sha256sums=('65e6b053e6d8be61763801312ded64a82cf835d77a6eabe1b9d7eb9e87b2e49b')
sha256sums_x86_64=('7be0fa9177401bc187186bf808a348de37cc4008e67e2705700108f438f26484')
sha256sums_aarch64=('5feaadd04bc28468400c8adebdc1f8cfc58f82569388af334bd482b8705eb77d')
sha256sums_armv7h=('28a7fb48fb14e5a0d283050d545ebe49b7f4654e6e4ecfacb203e1566d76a54a')
source=('vscodium-bin.desktop')
source_x86_64=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-armhf-${pkgver}.tar.gz")
source_aarch64=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-arm64-${pkgver}.tar.gz")

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
