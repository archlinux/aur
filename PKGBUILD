# Maintainer: ElectricSteve <aur at electricsteve dot dev>

pkgname=discipulus-bin
_pkgname=discipulus
pkgver=0.2.7
pkgrel=1
pkgdesc="Alternative Openbare Magister App voor Android, iOS, iPadOS, WatchOS, WearOS, macOS, Linux en Windows"
arch=('x86_64')
url="https://github.com/DiscipulusApp/Discipulus"
license=('GPL-3.0-only')
provides=('discipulus')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'glibc'
  'desktop-file-utils'
)
options=('!strip' '!debug')
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Linux.-.Discipulus.tar.gz"
  "${url}/raw/refs/tags/v${pkgver}/icon.svg"
  "${_pkgname}.desktop"
)
sha256sums=('84db72ed5aae045a253cafd3290ed5a62a25359e9e77ed85efafeda71caa6181'
            'ceaedc8d4546bd1d7b5c2abdd61333f191bb96f0434a021fa161148ae6edda96'
            '0ed077aabc79c5f452032f2c8c3ce17bb6705111ba2fe8119182d69ddf0b51eb')
install=discipulus.install

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/bundle/." "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/discipulus" "${pkgdir}/usr/bin/discipulus"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop" 
  install -Dm644 "icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
