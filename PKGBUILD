# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: Icelk <main at icelk.dev>
# Contributor: Cameron Katri <katri.cameron@gmail.com>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: me at oguzkaganeren dot com dot tr
# Contributor: Rowisi < nomail <at> private <dot> com >

pkgname=vscodium-bin
_pkgname=VSCodium
pkgver=1.56.1
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
provides=('codium')

sha256sums=('65e6b053e6d8be61763801312ded64a82cf835d77a6eabe1b9d7eb9e87b2e49b')
sha256sums_x86_64=('e6c8d8dc50ac3bc256a3709c9199facabf2fe15036bb174ce6993b91e976c8dc')
sha256sums_aarch64=('76dde1a5ff203af207c57ea734213d8cc2cfe35c2d0b6b40171551176c388447')
sha256sums_armv7h=('6a54b80514eafd1ff800ba8c4e69215b239f9e7bffdf39e1e88e15222e8ba137')
source=('vscodium-bin.desktop')
source_x86_64=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-armhf-${pkgver}.tar.gz")
source_aarch64=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-arm64-${pkgver}.tar.gz")

shopt -s extglob

package() {
  install -d -m755 ${pkgdir}/usr/bin
  install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
  cp -r ${srcdir}/!(vscodium-bin.desktop|${pkgname}-${pkgver}.tar.gz) ${pkgdir}/usr/share/${pkgname}
  ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
  ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
  install -D -m644 ${srcdir}/vscodium-bin.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -D -m644 ${srcdir}/resources/app/resources/linux/code.png \
          ${pkgdir}/usr/share/pixmaps/vscodium.png
}
