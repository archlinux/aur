# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=vr180-creator
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert your VR180 footage into a standardized format so you can edit it with leading editing tools like Adobe Premiere and then re-inject the appropriate metadata for publishing."
arch=('x86_64')
url="https://vr.google.com/vr180/apps/"
license=('MIT')
provides=('vr180-creator')
conflicts=('vr180-creator')
source=("$pkgname-$pkgver.tar.gz::https://storage.googleapis.com/vr180-creator/download/VR180_Creator_linux_$pkgver.tar.gz"
	'vr180-creator.desktop')
sha256sums=('68a980cfe478c7138d3e18c6f1bd65fe1ca21581df3ed2f55a836b0440df6d4b'
	    '361370df8302be08e341041960888b16497f74592bd64ed7c5163554f8d19f48')

package() {
  install -dm 755 "$pkgdir"/opt/vr180-creator
  cp -dr --no-preserve=ownership "$srcdir"/vr180_creator/* "$pkgdir"/opt/vr180-creator
  #find "$srcdir"/vr180_creator -type f | xargs -i echo "'{}' 'TARGET:{}'" | sed "s|TARGET.*vr180_creator|"$pkgdir"/opt/vr180-creator|g" | xargs -d '\n' -i bash -c "install -Dm 644 {}"

  install -dm 755 "$pkgdir"/usr/bin
  ln -s "$pkgdir"/opt/vr180-creator/'VR180 Creator' "$pkgdir"/usr/bin/vr180-creator

  install -dm 755 "$pkgdir"/usr/share/icons
  ln -s "$pkgdir"/opt/vr180-creator/images/vr180.png "$pkgdir"/usr/share/icons/vr180.png
  install -Dm 755 "$srcdir"/vr180-creator.desktop "$pkgdir"/usr/share/applications/vr180-creator.desktop
}
