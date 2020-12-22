# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=dvb-firmware
pkgname=openelec-dvb-firmware
pkgver=0.0.51
pkgrel=1
pkgdesc="DVB firmware from OpenELEC project"
arch=('any')
url="https://github.com/OpenELEC/${_reponame}"
license=('GPL3')
makedepends=('linux-firmware')
source=("https://github.com/OpenELEC/dvb-firmware/archive/${pkgver}.zip")
sha256sums=('bf4f354d1e428ce72bb845895510086fecccef90a84b5e68660cdeb290f53cf5')

# linux-firmware is required to make this package to avoid conflicts
# with files already provided by linux-firmware

package() {
  cd "${srcdir}/${_reponame}-${pkgver}/firmware"
  for _file in $(find -type f); do
    if [[ ! -f /usr/lib/firmware/$_file ]]; then
      install -Dm644 "$_file" "${pkgdir}/usr/lib/firmware/$_file"
    fi
  done
}
