# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=thrive
pkgver=0.5.4.0
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
source=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.0}/Thrive_${pkgver}_linux_x11.7z")
sha256sums=('2942bcaaf3904551446024049b9ef8213175750f774325c454795643697de6ee')

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
