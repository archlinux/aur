# Maintainer: Kiernan Preve <kiernanpreve@gmail.com>

_pkgname=8188gu
pkgname="${_pkgname}-dkms-git"
_pkgver=1.0
pkgver=1.0
pkgrel=1
pkgdesc='Standalone driver for Realtek RTL8188GU'
arch=('any')
url="https://github.com/KierPrev/rtl8188gu"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${_pkgname}::git+${url}#branch=v${_pkgver}"
	dkms.conf)
sha256sums=('SKIP'
            'SKIP')
provides=('8188gu-dkms')
conflicts=('8188gu-dkms')

pkgver() {
  cd "${_pkgname}"

  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"


  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Copy sources
  cd "${_pkgname}"

  for f in $(find . -type f); do
      install -Dm644 "$f" "${install_dir}/$f"
  done

  install -m644 "Makefile" "${install_dir}/Makefile"
}

