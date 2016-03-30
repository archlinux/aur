# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=dvb-firmware
pkgname=openelec-dvb-firmware-git
pkgver=113.6d2ec90
pkgrel=1
pkgdesc="DVB firmware from OpenELEC project (git)"
arch=('any')
url="https://github.com/OpenELEC/${_reponame}"
license=('GPL3')
conflicts=('openelec-dvb-firmware')
provides=('openelec-dvb-firmware')
makedepends=('git' 'linux-firmware')
source=("git+https://github.com/OpenELEC/${_reponame}.git")
md5sums=('SKIP')

# linux-firmware is required to make this package to avoid conflicts
# with files already provided by linux-firmware

pkgver() {
  cd "${srcdir}/${_reponame}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${_reponame}/firmware"
  for _file in $(find -type f); do
    if [[ ! -f /usr/lib/firmware/$_file ]]; then
      install -Dm644 "$_file" "${pkgdir}/usr/lib/firmware/$_file"
    fi
  done
}
