# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=thrive-bin
pkgver=0.6.1.0
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
source=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.0}/Thrive_${pkgver}_linux_x11.7z")
sha256sums=('59f8312c49096397f49ae5fe8886105d310b722f4380742c0c9fc7e3adaf2b6e')
provides=(thrive)
conflicts=(thrive)

prepare() {
  mv "Thrive_${pkgver}_linux_x11"/Thrive.{desktop,png} .
  sed s,Exec=Thrive,Exec=/opt/thrive/Thrive, -i Thrive.desktop
}

package() {
  install -dm755 --group games "$pkgdir/opt/thrive"
  cp -r "Thrive_${pkgver}_linux_x11"/* "$pkgdir/opt/thrive"

  desktop-file-install --dir "$pkgdir"/usr/share/applications Thrive.desktop
  install -Dm644 Thrive.png "$pkgdir"/usr/share/icons/Thrive.png
}
