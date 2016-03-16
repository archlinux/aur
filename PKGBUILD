# Maintainer: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=8.1.1
pkgrel=2
pkgdesc="JavaFX visual layout tool with sereral improvements by Gluon"
arch=('any')
url="http://gluonhq.com/open-source/scene-builder/"
license=('Oracle BSD License')
groups=()
depends=('bash' 'java-environment')
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
        http://download.gluonhq.com/scenebuilder/$pkgver/SceneBuilder-$pkgver.jar
	$pkgname.png
        $pkgname
)
noextract=(SceneBuilder-$pkgver.jar)
sha256sums=('189c2ecd20e9258a797c7e604d2ec735ca92f48036a7a5d363cad2ea20702064'
            '963a57d2c61b23cd4a09f2d33924a0e206174e72a8c28f13a4a68f2c643827a8'
            '5dc69e3d4dcc395204567c54243105053c54e7f4633fdeac5de19aec7fc5fd1d')
prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  unzip SceneBuilder-$pkgver.jar LICENSE
}
package() {
  # copy files
  cd "$srcdir"
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 SceneBuilder-$pkgver.jar "$pkgdir/opt/$pkgname/$pkgname.jar"
  install -m755 $pkgname "$pkgdir/usr/bin/$pkgname"  
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" 
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
