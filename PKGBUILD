# Maintainer: Marco Pompili <aur (at) mg (dot) odd (dot) red>
# Contributor: Gautham Velchuru <gvelchuru@gmail.com>

pkgname=kiibohd-configurator-git
_pkgname=kiibohd-configurator
pkgver=r286.2e12869
pkgrel=1
pkgdesc="Client Side Configuration & Flashing Software for Kiibohd compatible keyboards"
arch=('x86_64')
url="https://github.com/kiibohd/configurator"
license=('GPL3')
depends=('dfu-util')
makedepends=('yarn' 'nodejs-lts-hydrogen')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${pkgname}::git+https://github.com/kiibohd/configurator.git")
sha256sums=('SKIP')

#_pkg="${srcdir}/${pkgname}"
#cd "${_pkg}"
#cp -R * "${pkgdir}/usr/share/${_pkgname}"

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  yarn
  yarn dist:dir
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${pkgname}/output/linux-unpacked" "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
