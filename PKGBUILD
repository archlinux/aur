pkgname=ipmiview
pkgver=2.17.0
_pkghash=200505
pkgrel=4
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime=8")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"

backup=(
    "opt/${pkgname}/account.properties"
    "opt/${pkgname}/email.properties"
    "opt/${pkgname}/iKVM.properties"
    "opt/${pkgname}/IPMIView.properties"
    "opt/${pkgname}/stunnel.properties"
    "opt/${pkgname}/timeout.properties"
    )

source=(
    "https://www.supermicro.com/wftp/utility/IPMIView/Linux/IPMIView_${pkgver}_build.${_pkghash}_bundleJRE_Linux_x64.tar.gz"
    'ipmiview.desktop'
    'ipmiview.png'
    )

sha512sums=(
    '17ed72e802fb0a55c140f98262575385ede2d490484fe926bb7ff19f34e5a376f2d21025e99318d2001b042487729dc8b07b38cca4bf62df6e04d7df0d1d3091'
    '82f6d4a9f6ff031f0c7e7ab78a550ea76b8e297df62aaa9837a37fe4f0b4a8b4dfa4aae59c0edc9ee2f0b7e249548ba4f5f50a44e0682a7f7b6f098163a17879'
    'd1fb8e68ca057e3b2bc1c6e51cda226443c729db5166363d637a536afc07aab285ba46f9da5f656837e2423685a0ae421789a4768acee5ac8185ecb04318fc81'
    )

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications

  pushd ${srcdir}/IPMIView_${pkgver}_build.${_pkghash}_bundleJRE_Linux_x64
  rm -rf jre/ # Remove bundled jre
  cp -rf . ${pkgdir}/opt/${pkgname}
  popd

  touch ${pkgdir}/opt/${pkgname}/account.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/account.properties

  touch ${pkgdir}/opt/${pkgname}/email.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/email.properties

  touch ${pkgdir}/opt/${pkgname}/iKVM.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/iKVM.properties

  touch ${pkgdir}/opt/${pkgname}/IPMIView.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/IPMIView.properties

  touch ${pkgdir}/opt/${pkgname}/stunnel.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/stunnel.properties

  touch ${pkgdir}/opt/${pkgname}/timeout.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/timeout.properties

  ln -s /opt/${pkgname}/IPMIView20 ${pkgdir}/usr/bin/${pkgname}
  install -m 0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  install -m 0644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/"
}
