_pkgname=mari0_ae
pkgname="$_pkgname-git"
pkgver=13.2.r11.gc75ae92
pkgrel=1
pkgdesc="Recreation of Super Mario Bros, with portals"
arch=('any')
options=("!strip" "!debug")
url="https://github.com/alesan99/mari0_ae"
license=('DWTFYWTPL')
depends=('love' 'sh')
makedepends=('git' 'zip')
source=("$_pkgname.desktop"
        "$_pkgname.sh"
        "git+https://github.com/alesan99/mari0_ae.git")
sha256sums=('53be8ffb934a751ec0d7098fcbcf10a67f6a67fef65a9ccdd5811b06d6dab6e8'
        '6d65a423a3496138c996a747135d1030ef463a51d58de1c9986330cf52fe34f3'
        'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Make love package
  cd "${srcdir}"/${_pkgname}
  zip -r9 "${srcdir}"/${_pkgname}.love *

  # Install Data
  install -Dm755 "${srcdir}/${_pkgname}.love" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.love"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "$pkgdir/usr/share/${_pkgname}/README.md"

  # Install Launcher
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Install Desktop
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/graphics/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"


}
