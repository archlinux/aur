# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=spacedrive-clean
pkgver=0.4.3
pkgrel=2
pkgdesc="A file manager from the future - powered by a virtual distributed filesystem. A cleaner version, since other packages are bloated or broken."
arch=('x86_64')
url="https://www.spacedrive.com"
license=('AGPL-3.0-only')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'dbus'
    'xdotool'
    'glibc'
)
provides=('spacedrive')
conflicts=('spacedrive' 'spacedrive-bin' 'spacedrive-git')
source=("${pkgname}-${pkgver}.deb::https://github.com/spacedriveapp/spacedrive/releases/download/${pkgver}/Spacedrive-linux-x86_64.deb")
sha256sums=('30b0801cd2c9ffd6dd0812c106cb2ba64f7cbaf2937c7b3d606c66c49d75fe86')
options=(!strip)

package() {
    # Extract data from deb directly to pkgdir
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    
    # Fix case-sensitivity issue: binary expects lowercase 'spacedrive' in RUNPATH
    # but .deb extracts to 'Spacedrive' (capital S)
    mv "${pkgdir}/usr/lib/Spacedrive" "${pkgdir}/usr/lib/spacedrive"
    
    # Fix permissions
    chmod 755 "${pkgdir}/usr/bin/spacedrive"
}
