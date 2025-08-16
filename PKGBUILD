# Maintainer: Can Celasun <can[at]dcc[dot]im>

pkgname=paradox-launcher
pkgver=2025.10
pkgrel=1
epoch=1
pkgdesc="Paradox Interactive Game Launcher v2"
arch=('x86_64')
url="https://play.paradoxplaza.com/"
license=('custom')
depends=("libnotify" "libxtst" "nss" "alsa-lib" "libxss")
_source=https://launcher.paradoxinteractive.com/v2/paradox-launcher-installer-${pkgver//./_}.deb
source=(${pkgname}-${pkgver}.deb::${_source})
sha256sums=('9444841ee5c1e24963c1950b03bd18fe20085b12bbc8b18c09595e396d2fc278')

package() {
  mkdir -p "${pkgdir}"/opt
  mkdir -p "${pkgdir}"/usr/bin

  cd "${srcdir}"
  tar -xzvf data.tar.gz

  cp -R "${srcdir}"/opt/* "${pkgdir}"/opt/ -R
  cp -R "${srcdir}"/usr/* ${pkgdir}/usr/ -R

  sed -i 's|Icon=Launcher|Icon=PDXLauncher|g' "${pkgdir}"/usr/share/applications/paradox-launcher-v2.desktop
  find "${pkgdir}"/usr/share/icons/ -type f -name "Launcher.png" -exec rename Launcher.png PDXLauncher.png {} \;

  ln -s /opt/Paradox\ Interactive/Paradox\ Launcher\ v2/dowser "${pkgdir}"/usr/bin/dowser
}
