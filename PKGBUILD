# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='sejda-desktop'
pkgver='6.0.6'
pkgrel='1'
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://sejda-cdn.com/downloads/sejda-desktop_${pkgver}_amd64.deb")
md5sums=('5d3e0ed5fdbe07313b3fefc0517c89e5')
sha512sums=('e4d64b856f4bae035df471f58ce4373b8abd7b612b5899d154561ad8c401008b77e5fcaf92f25fe66076bdb827ce86ee88981cc8b73172e72b1b0039237f3f89')
options=('!strip')
PKGEXT='.tar.gz'

package() {
  bsdtar --no-same-owner --no-same-permissions -xf 'data.tar.gz' -C "${pkgdir}"
  cd "${pkgdir}"
  install -d 'usr/bin'
  ln -s '/opt/sejda-desktop/sejda-desktop' 'usr/bin/sejda-desktop'

  find -type 'f' '(' -name '.DS_Store' -o -iname '*.bat' ')' -delete

  # fix permissions
  #find "${pkgdir}" -type 'd' -exec chmod 755 '{}' ';'
  #find "${pkgdir}" -type 'f' -exec chmod 644 '{}' ';'
  #chmod 755 'opt/sejda-desktop/resources/vendor/desktop-launcher/bin/desktop-launcher'
  ## chmod 755 'opt/sejda-desktop/resources/vendor/java-linux/bin/java'
  #chmod 755 'opt/sejda-desktop/sejda-desktop'

  # symlink licenses
  install -d "usr/share/licenses/${pkgname}"
  local _i
  for _i in 'EULA.pdf' 'LICENSE.electron' 'LICENSES.chromium.html'; do
    ln -s "/opt/sejda-desktop/${_i}" "usr/share/licenses/${pkgname}/${_i}"
  done
}
