# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=jetbrains-air
pkgname=(jetbrains-air jetbrains-air-jre)
pkgver=262.43.32
pkgrel=1
arch=('x86_64' 'i686')
url='https://air.dev/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=(
  "https://download.jetbrains.com/air/installers/linux_x64/Air-${pkgver}.tar.gz"
  jetbrains-air.desktop
  LICENSE
)
b2sums=('577fe995541b873d0ea0a573717a663c6f1b985acea52ccb540326d007f0ec072502c80309e7e978fe914da363a9854e5f8643ee19bb97b21b8f85d519b0685b'
        'f9b91c558db8c82ac97ceb66219f1f9dae86834843b2a5fcc1f1029c217a91877dafc81e73b0fa8e6b86f485d75611fbfe252adb275fe055c129cdbf0c392424'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_jetbrains-air() {
  pkgdesc='An Agentic Development Environment by Jetbrains'
  optdepends=(
    'jetbrains-air-jre: JetBrains custom Java Runtime (Recommended)'
    'java-runtime: JRE - Required if jetbrains-air-jre is not installed'
  )
  conflicts=('air')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/Air/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  chmod 755 "${pkgdir}"/opt/${pkgbase}/bin/Air
  find "${pkgdir}"/opt/${pkgbase}/lib/ -iname "*.jar" -exec chmod 644 {} \;

  ln -s /opt/${pkgbase}/bin/Air "${pkgdir}"/usr/bin/air
  install -m644 "${srcdir}"/${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/lib/Air.png "${pkgdir}"/usr/share/pixmaps/${pkgbase}.png
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_jetbrains-air-jre() {
  pkgdesc='JBR (JetBrains Runtime) for Air - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/Air/jbr "${pkgdir}"/opt/${pkgbase}
}
