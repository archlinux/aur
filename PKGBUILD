# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=thrive
pkgver=0.5.8.1
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
source=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.0}/Thrive_${pkgver}_linux_x11.7z")
sha256sums=('5c75ca15827af5337f11c9ac54078921ff7f09014a4e0367a7415e1b7f82e44e')

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
