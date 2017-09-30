# Maintainer: Jake <ja.ke@posteo.de>
# Last Maintainer (Submitter): Vincent van Donselaar <vincent@van-donselaar.nl>
pkgname=fiddler
pkgver=4.6.20171.26113
pkgrel=1
pkgdesc="The free web debugging proxy by Telerik (running on mono)"
arch=('any')
url="http://getfiddler.com/"
license=('custom')
depends=('mono')
source=("http://telerik-fiddler.s3.amazonaws.com/${pkgname}/${pkgname}-linux.zip"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.sh")
sha1sums=('112a1ae7c350d702b1dc368b24f16e3bb1843dbd'
          'bee1aeabed80319c5c24b7930bf763b982675b58'
          'da3c1afeb3a4ec8911766a548175b1138810e14d'
          '2f84386c418f50c10229deb8416047bae6333969')

package() {
  rm "${srcdir}/${pkgname}-linux.zip"

  cd "${pkgdir}"  
  
  install -d "${pkgdir}/opt" 
  cp -r "${srcdir}" "${pkgdir}/opt/${pkgname}"  
  install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  
  # Files that get written on runtime 
  cd ${pkgdir}/opt/${pkgname}/
  touch proxyinfo.conf proxiesFromInterfaces.txt listeningProcess.txt gsettings.txt
  chmod 777 proxyinfo.conf proxiesFromInterfaces.txt listeningProcess.txt gsettings.txt
}
