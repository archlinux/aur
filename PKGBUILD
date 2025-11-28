# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Aner Andros <code@anerandros.info>

set -u
#pkgbase='git-it'
pkgname='git-it'
pkgver='6.0.1'
pkgrel='1'
pkgdesc='Desktop app that teaches you how to use Git and GitHub on the command line.'
arch=('x86_64')
#url='https://github.com/jlord/git-it-electron'
url='https://github.com/Git-it-App/git-it-electron'
license=('BSD-2-Clause')
depends=('alsa-lib')
#depends+=('gnuplot' 'libxtst' 'libxss' 'nodejs' 'nss' 'gconf')
#depends+=('gtk2')
depends+=('git')
depends+=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'cairo' 'at-spi2-core' 'mesa' 'dbus' 'libxrandr' 'libxext' 'libxcomposite' 'libx11' 'libcups' 'systemd-libs' 'pango' 'libxkbcommon' 'libxcb' 'libxfixes' 'libxdamage' 'expat' 'nss' 'nspr')
#provides=('git-it')
options=('!strip')
_srcdir='Git-it-linux-x64'
_file="${_srcdir}-${pkgver}.zip"
source=(
  "${url}/releases/download/v${pkgver}/${_file}"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
noextract=("${_file}")
md5sums=('b3358874da0fa412a9c5cbdc5da9cdde'
         'cc6162296991cdb4463081962c0018f1'
         '3fc4074dd6efa11246481d57dae86cf1')
sha256sums=('2c990d2e5e8afa4e8cc5fa950e2c76e65150f5d0dc9ac8a2e7888471831f96b9'
            '2ad08e42d2774e746c2730bcc90f089e2e97ad7c79875a52c3d341ad75affdfc'
            '55ff797c3449f24f5e53186f3e08aacd98b832b7191b8893c2d7b26b52e2a375')

package() {
  set -u
  install -d "${pkgdir}/opt/"

  bsdtar --no-same-owner -C "${pkgdir}/opt/" -xf "${_file}"
  find "${pkgdir}/opt" -type 'd' -exec chmod 'go+rx' '{}' '+'
  mv "${pkgdir}/opt"/{"${_srcdir}",'git-it'}
  chmod 755 "${pkgdir}/opt/git-it/Git-it"

  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/git-it/Git-it' "${pkgdir}/usr/bin/git-it"

  install -Dpm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dpm644 "${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dpm644 "${pkgdir}/opt/git-it/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}
set +u
