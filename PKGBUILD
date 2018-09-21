# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=evostream-mediaserver
pkgver=2.0.1.5649
pkgrel=1
pkgdesc="EvoStream Media Server"
arch=('x86_64')
url="https://evostream.com/"
license=('custom')
install="${pkgname}.install"
provides=('evostreamms')
conflicts=('evostreamms')
source=("http://apt.evostream.com/release/debian/9.4/pool/main/e/evostream-mediaserver/${pkgname}_${pkgver}-1_amd64.deb")
md5sums=('d98fc3d21516f7ddfde6729d0a4f90b3')

package() {
  depends=('evostream-libavbin' 'evostream-web' 'evostream-systemd')

  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  msg2 "Preparing license..."
  pdftotext "${pkgdir}/usr/share/doc/evostreamms/Evostream Media Server EULA v2.pdf"

  msg2 "Adding license..."
  install -Dm644 "${pkgdir}/usr/share/doc/evostreamms/Evostream Media Server EULA v2.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/evostreamms/Evostream Media Server EULA v2.txt"

  msg2 "Removing SysVInit script..."
  rm -rf "${pkgdir}/etc/init.d"

  msg2 "Correcting path..."
  mv "${pkgdir}/var/run/" "${pkgdir}/run/"
}
