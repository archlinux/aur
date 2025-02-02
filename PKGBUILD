# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=blackwidowcontrol-git
_reponame=${pkgname%-git}
pkgver=33.9c8cab2
pkgrel=1
pkgdesc='Python script to enable macro keys of the Razer BlackWidow keyboard under GNU/Linux'
arch=('any')
license=(GPL-2.0-or-later)
depends=('python-pyusb')
makedepends=('git')
conflicts=(${_reponame})
provides=(${_reponame})
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  local _srcdir="$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  install -Dm755 "${_srcdir}/blackwidowcontrol.py" "${pkgdir}/usr/bin/blackwidowcontrol"
  install -Dm644 "${_srcdir}/razer_blackwidow.rules" "${pkgdir}/etc/udev/rules.d/70-razer_blackwidow.rules"
}
