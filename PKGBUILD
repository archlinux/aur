pkgname=ipmiview
pkgver=2.23.0
pkgrel=1
_pkgdate=250519
_downloadID=960
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime")
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
    "IPMIView_${pkgver}-${_pkgdate}.tar.gz::https://www.supermicro.com/support/resources/getfile.php?SoftwareItemID=${_downloadID}&type=serversoftwarefile"
    'ipmiview.desktop'
    'ipmiview.png'
    )

sha512sums=('b673f62a852024da336db18c4f50996415351856897caa3c44df3bff6487d334d7a43b48025a39939e32213c48f2c725265627463743c5810bd1eae123da4a4a'
            '82f6d4a9f6ff031f0c7e7ab78a550ea76b8e297df62aaa9837a37fe4f0b4a8b4dfa4aae59c0edc9ee2f0b7e249548ba4f5f50a44e0682a7f7b6f098163a17879'
            'd1fb8e68ca057e3b2bc1c6e51cda226443c729db5166363d637a536afc07aab285ba46f9da5f656837e2423685a0ae421789a4768acee5ac8185ecb04318fc81')

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications

  pushd ${srcdir}/IPMIView_${pkgver}_build.${_pkgdate}_bundleJRE_Linux_x64
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
