# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Hilinus <itahilinus at hotmail dot it>
# Contributor: Alucryd <alucryd at gmail dot com>

set -u
pkgname='teamviewer8'
pkgver='8.0.20931'
pkgrel='1'
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('i686' 'x86_64')
url='https://www.teamviewer.com'
license=('custom')
depends_i686=('gcc-libs' 'alsa-lib' 'libxdamage' 'libxtst' 'zlib' 'freetype2')
depends_x86_64=("${depends_i686/#/lib32-}")
depends=('bash')
provides=("teamviewer=${pkgver%%.*}")
conflicts=('teamviewer')
options=('!strip')
install="${pkgname}.install"
source_i686=("teamviewer_linux-${pkgver}.deb::http://www.teamviewer.com/download/version_8x/teamviewer_linux.deb")
source_x86_64=("teamviewer_linux_x64-${pkgver}.deb::http://www.teamviewer.com/download/version_8x/teamviewer_linux_x64.deb")
md5sums_i686=('218ecec198d5e6ce30958736d88e6645')
md5sums_x86_64=('bb2c1f70b6d58379aca987e57435293c')
sha256sums_i686=('6ad27b106a125c51075597c526b7b84fa9637af1aef6ee0514faa49694bf70dd')
sha256sums_x86_64=('134c7ce23b2ea7194073d93450dd5ba14bd3704deb8dceffd5b5e5945c09b568')

#PKGEXT='.pkg.tar.gz'

prepare() {
  set -u
  cd "${srcdir}"
  bsdtar -xf 'data.tar.gz'
  set +u
}

package() {
  set -u
  cd "${srcdir}"

# Install
  cp -dr --no-preserve='ownership' 'etc' 'opt' 'usr' 'var' "${pkgdir}/"

# Additional files
  rm "${pkgdir}/opt/teamviewer8/tv_bin/xdg-utils/xdg-email"
  install -dm755 "${pkgdir}/usr"/{lib/systemd/system,share/applications,share/licenses/teamviewer}
  install -Dm644 "${pkgdir}/opt/teamviewer8/tv_bin/script/teamviewerd.service" -t "${pkgdir}/usr/lib/systemd/system/"
  ln -s '/opt/teamviewer8/tv_bin/desktop/teamviewer-teamviewer8.desktop' -t "${pkgdir}/usr/share/applications/"
  ln -s '/opt/teamviewer8/License.txt' "${pkgdir}/usr/share/licenses/teamviewer/LICENSE"
  set +u
}
set +u
