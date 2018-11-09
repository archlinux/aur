# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: tjbp (archlinux@tjbp.net)
 
pkgname=shashlik-bin
pkgver=0.9.3
pkgrel=4
pkgdesc="A way to run Android applications on a standard Linux desktop as easily and simply as possible"
arch=("x86_64")
url="http://www.${pkgname%-bin}.io"
license=("GPL")
depends=("lib32-libgl" "python")
optdepends=("kdialog")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.deb::http://static.davidedmundson.co.uk/${pkgname%-bin}/${pkgname%-bin}_${pkgver}.deb")
sha256sums=("a0a9daaeea0436ec8bd90b97112694974f7cf121d5a54083244488ff2d86dbaa")

build() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C .
  chmod u+w "${srcdir}/opt/${pkgname%-bin}/android/system"
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -r "${srcdir}/opt" "${pkgdir}/"
  ln -s /opt/${pkgname%-bin}/bin/${pkgname%-bin}-run "${pkgdir}/usr/bin/"
  ln -s /opt/${pkgname%-bin}/bin/${pkgname%-bin}-install "${pkgdir}/usr/bin/"
}
