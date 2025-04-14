# Maintainer: Thibault Molleman <aur at thibaultmol d0t link>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=7.8.6
pkgrel=1
pkgdesc="Proprietary commercial PDF editor"
arch=(x86_64)
url="https://www.sejda.com/desktop"
license=(LicenseRef-EULA)
depends=(libxcb libxfixes nspr alsa-lib libcups at-spi2-core libxrandr libdrm libxrender pango nss libxcomposite cairo
         libxdamage libxkbcommon mesa gtk3 libx11 glibc bash expat libxext libxtst dbus libxi gcc-libs glib2)
options=('!strip')
source_x86_64=("https://downloads.sejda-cdn.com/sejda-desktop_7.8.6_amd64.deb")
sha512sums_x86_64=('30387ece225cc825fb734fe2572a767fde0407bb85e1e126d5273306791a741a61e2aa6babcdf001e611157b8ce1ce7406a6a96fceb3b3262dcda4096ef2c6a6')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/sejda-desktop/sejda-desktop "${pkgdir}"/usr/bin/sejda-desktop

  install -D "${pkgdir}"/opt/sejda-desktop/EULA.pdf -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D "${pkgdir}"/opt/sejda-desktop/resources/vendor/desktop-launcher/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Fix permission warning, our folders are 755 not 775 as in sejda package
  chmod 755 -R "${pkgdir}"

  # remove .DS_Store and .bat files
  cd "${pkgdir}"
  find -type 'f' '(' -name '.DS_Store' -o -iname '*.bat' ')' -delete
}
