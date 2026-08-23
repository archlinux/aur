# See contacts at https://aur.archlinux.org/cgit/aur.git/tree/README.md?h=elph-nova-bin

pkgname=elph-nova-bin
_pkgname=elph-nova
pkgver=3.5.0
pkgrel=1
pkgdesc="A corporate communications hub designed for effective collaboration with colleagues"
arch=("x86_64")
# url="https://docs.eltex-co.ru/display/doc/Elph+Desktop"
license=("custom")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libappindicator')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://archive.eltex-co.ru/repository/elph-services-raw/${_pkgname}/${pkgver}/linux/${_pkgname}-${pkgver}-linux-x64.deb")
sha256sums=('25f8c93fb47031be752dada443b3839a27da9b4eeb68f4ba31e6928fe34df3fc')

prepare() {
  tar -xvf data.tar.xz

  sed -i 's/Categories=.*;/Categories=Chat;Network;InstantMessaging;/' "usr/share/applications/${_pkgname}.desktop"
}

package() {
  mkdir -vp "${pkgdir}/usr/share/applications"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/applications" "${pkgdir}/usr/share/"

  mkdir -vp "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/doc/${_pkgname}" "${pkgdir}/usr/share/doc/"

  mkdir -vp "${pkgdir}/usr/share/icons"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/icons" "${pkgdir}/usr/share/"

  mkdir -vp "${pkgdir}/opt/Elph Nova"
  cp -vr --no-preserve=ownership --preserve=mode "opt/Elph Nova" "${pkgdir}/opt/"
}
