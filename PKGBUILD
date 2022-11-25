# Maintainer: 33Fraise33 <aur at frai dot se>

pkgname=taniumclient
pkgver=7.4.9.1046
pkgrel=1
pkgdesc="Tanium Client for Arch Linux endpoints"
arch=("x86_64")
url="https://tanium.com"
license=("custom")
install="${pkgname}.install"
source=(
  "manual://${pkgname}_${pkgver}-debian11_amd64.deb"
  "LICENSE"
)
sha256sums=(
  "c5f3f75214b7f25141aa2e5a8d100235e87f05b0bc35e4358b223d9b9a578997"
  "f818fb7e486226555576c360658dcac5488d3dde9d58438664b0a7102a394edf"
)

prepare() {
  mkdir "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"

  bsdtar -xf "${srcdir}/data.tar.gz" -C .
}

package() {
  cd "${srcdir}/${pkgname}"
  cp -r "${srcdir}/${pkgname}/"* "${pkgdir}"
  install -dm755 "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod a+x "${pkgdir}/opt/Tanium/TaniumClient"
  chmod -R a+r "${pkgdir}/opt/Tanium/TaniumClient"
}
