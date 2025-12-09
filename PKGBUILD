# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=dataspell
pkgname=(dataspell dataspell-jre)
pkgver=2025.3
pkgrel=1
pkgdesc='Python IDE for data scientists'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/dataspell/'
depends=('glib2' 'python')
options=('!strip')
source=("https://download.jetbrains.com/python/dataspell-${pkgver}.tar.gz"
        jetbrains-dataspell.desktop
        LICENSE)
b2sums=('266c901cc90bfbd1da957fd33c6ba7af9c3760e6ef0d320778afc064c50fb01c65adc83dd8f377fc9fa47c8cd7c4987a7e4958577061958be7519401d1fd467e'
        '8be7fe3930b001992d249893fd80f5af3d11bd9c3095dfe4a0a95a5c3cdc07c3963971aa29bdeaca76a0b8413103d1c6d940f34e0ad6695ba7bac007f81411db'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_dataspell() {
  optdepends=('dataspell-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if dataspell-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/dataspell-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  chmod +x "${pkgdir}"/opt/dataspell/plugins/r-plugin/rwrapper*linux

  ln -s /opt/${pkgbase}/bin/${pkgbase} "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_dataspell-jre() {
  pkgdesc='JBR (JetBrains Runtime) for DataSpell - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/dataspell-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
