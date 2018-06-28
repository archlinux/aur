# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Aner Andros <code@anerandros.info>

set -u
pkgbase='git-it'
pkgname='git-it'
pkgver='4.3.3.0'; _pkgver='4.3.0'
pkgrel='1'
pkgdesc='Desktop app that teaches you how to use Git and GitHub on the command line.'
arch=('x86_64')
url='https://github.com/jlord/git-it-electron'
license=('BSD')
depends=('gnuplot' 'libxtst' 'libxss' 'alsa-lib' 'nodejs' 'nss' 'gconf')
provides=('git-it')
options=('!strip')
_file="Git-it-Linux-x64-${_pkgver}.zip"
source=(
  "${_file}::https://github.com/jlord/git-it-electron/releases/download/${_pkgver}/Git-it-Linux-x64.zip"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
noextract=("${_file}")
md5sums=('2162a1c74af9baa4aa714780ae548504'
         'cc6162296991cdb4463081962c0018f1'
         '3fc4074dd6efa11246481d57dae86cf1')
sha256sums=('6a7308459fe0f6f7fc135e0cb76d6c6f2006851074d7ec7732e5760fa3e74d7c'
            '2ad08e42d2774e746c2730bcc90f089e2e97ad7c79875a52c3d341ad75affdfc'
            '55ff797c3449f24f5e53186f3e08aacd98b832b7191b8893c2d7b26b52e2a375')
#PKGEXT='.tar.gz'

package() {
  set -u
  install -d "${pkgdir}/opt/"

  bsdtar --no-same-owner -C "${pkgdir}/opt/" -xf "${_file}"
  mv "${pkgdir}/opt"/{Git-it-Linux-x64,git-it}

  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/git-it/Git-it' "${pkgdir}/usr/bin/git-it"

  install -Dpm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dpm644 "${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dpm644 "${pkgdir}/opt/git-it/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}
set +u
