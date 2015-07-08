# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-firefox-profile
pkgver=20140804
pkgrel=1
_username="user"
_userdir="/home/${_username}"
_profiledir="${_userdir}/.mozilla/firefox"
_configdir="usr/lib/firefox/browser"
pkgdesc="Firefox profile for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-firefox-profile"
license=('unknown')
depends=('justbrowsing-home')
makedepends=('unzip')
optdepends=('firefox: web browser')
options=('!docs')
source=(https://github.com/justbrowsing/${pkgname}/archive/master.zip)
md5sums=('91f37e19f97fd31303e2ef45952eee0d')

package() {
  cd "$srcdir/${pkgname}-master"
  mkdir -p "${pkgdir}/${_profiledir}"
  chmod 0700 "${pkgdir}/${_userdir}"
  chmod -R 0700  "${pkgdir}/${_userdir}/.mozilla"

  cp -dr --preserve=mode,timestamp firefox.jb "${pkgdir}/${_profiledir}"
  cp -dr --preserve=mode,timestamp oknp3n8p.default "${pkgdir}/${_profiledir}"
  cp -d --preserve=mode,timestamp profiles.jb "${pkgdir}/${_profiledir}"
  cp -d --preserve=mode,timestamp profiles.ini "${pkgdir}/${_profiledir}"
  chmod -R 0755 "${pkgdir}/${_profiledir}/firefox.jb"
  chown -R "${_username}:${_username}" "${pkgdir}/${_profiledir}"

  mkdir -p "${pkgdir}/${_configdir}"
  install -Dm644 "${_configdir}/override.ini" "${pkgdir}/${_configdir}/override.ini"
}
