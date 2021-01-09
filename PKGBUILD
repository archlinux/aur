# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=thrive
pkgver=0.5.3.0
pkgrel=2
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
source=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.0}/Thrive_${pkgver}_linux_x11.7z"
        "Thrive.desktop"
        "Thrive.png")
sha256sums=('475ed6b6b4f8bccde221b25c4f3f201594ad06821448382d266d617fbcf772cc'
            'fa23cf5b202ea838626f904614c53a797257ca66cdce221c2a331be357a37118'
            '275e1044877c71f5cc49ccc047330993da1e0e78558177b90f6b5a18d0d7f884')

prepare() {
  sed s,Exec=Thrive,Exec=/opt/thrive/Thrive, -i Thrive.desktop
}

package() {
  install -dm755 --group games "$pkgdir/opt/thrive"
  cp -r "Thrive_${pkgver}_linux_x11"/* "$pkgdir/opt/thrive"

  desktop-file-install --dir "$pkgdir"/usr/share/applications Thrive.desktop
  install -Dm644 Thrive.png "$pkgdir"/usr/share/icons/Thrive.png
}
