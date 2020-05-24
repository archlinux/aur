_reponame=dvb-firmware
pkgname=libreelec-dvb-firmware-git
pkgver=147.82f1b52
pkgrel=1
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
