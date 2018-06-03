# Maintainer: Ivan Marquesi Lerner <ivanml1992 @!@ gmail.com>

pkgname=plotagraph
pkgver=1.2.8
pkgrel=1
pkgdesc="A cloud-based photo-animation software."
arch=('x86_64')
url="https://plotaverse.com/"
license=('custom')
depends=('gconf' 'libnotify' 'libappindicator-gtk2'
	 'libxtst' 'nss' 'libxss' 'alsa-lib')
install="$pkgname.install"
source=("http://download.plotagraphapp.com/build/${pkgname/p/P}_${pkgver}_amd64.deb"
	"LICENSE")
md5sums=('19101f25f321aed641b7912a91b56671'
         'a3d5cc205f77a6939c5550ed80b40615')

prepare() {
  cd "${srcdir}"

  tar -xzf control.tar.gz
  tar -xJf data.tar.xz

}

check() {
  md5sum -c md5sums
}

package() {
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  
  install -D "${srcdir}"/usr/share/applications/"${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop

  install -D "${srcdir}"/usr/share/doc/"${pkgname}"/changelog.gz "${pkgdir}"/usr/share/doc/"${pkgname}"/changelog.gz

  for size in 16 24 32 48 64 96 128 256; do
    install -D "${srcdir}"/usr/share/icons/hicolor/"${size}"x"${size}"/apps/"${pkgname}".png "${pkgdir}"/usr/share/icons/hicolor/"${size}"x"${size}"/apps/"${pkgname}".png
  done

  chmod -R go-w "${pkgdir}"/usr

  install -d "${pkgdir}"/opt/Plotaverse
  cp -a "${srcdir}"/opt/Plotaverse/* "${pkgdir}"/opt/Plotaverse/
}
