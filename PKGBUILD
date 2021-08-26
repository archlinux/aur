# Maintainer:
# Contributor: FabioLolix
# Contributor: Daniel Albers

_reponame=dvb-firmware
pkgname=libreelec-dvb-firmware-git
pkgver=1.4.2.r1.g0eaf5b3
pkgrel=1
epoch=1
pkgdesc="DVB firmware from LibreELEC project (git)"
arch=('any')
url="https://github.com/LibreELEC/${_reponame}"
license=('GPL3')
conflicts=('libreelec-dvb-firmware' 'openelec-dvb-firmware')
replaces=('openelec-dvb-firmware')
provides=('libreelec-dvb-firmware')
makedepends=('git' 'linux-firmware')
source=("git+https://github.com/LibreELEC/${_reponame}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_reponame}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_reponame}/firmware"
  for _file in $(find -type f); do
    if [[ ! -f /usr/lib/firmware/$_file ]]; then
      install -Dm644 "$_file" "${pkgdir}/usr/lib/firmware/$_file"
    fi
  done
}
