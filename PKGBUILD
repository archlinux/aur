# Maintainer: Thibault Molleman <aur at thibaultmol d0t link>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=7.8.2
pkgrel=1
pkgdesc="Proprietary commercial PDF editor"
arch=(x86_64)
url="https://www.sejda.com/desktop"
license=(LicenseRef-EULA)
depends=(libxcb libxfixes nspr alsa-lib libcups at-spi2-core libxrandr libdrm libxrender pango nss libxcomposite cairo
         libxdamage libxkbcommon mesa gtk3 libx11 glibc bash expat libxext libxtst dbus libxi gcc-libs glib2)
options=('!strip')
source_x86_64=("https://downloads.sejda-cdn.com/sejda-desktop_${pkgver}_amd64.deb")
sha512sums_x86_64=('c52c848c5e1fab895c728983237079d633d723f370b928723d2d4252f2e6293ed0310b4279161528a6baf1083fa90088fc6b9f8bd4b3821ad8ef3bcc81c17358')

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
