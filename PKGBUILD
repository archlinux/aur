# Maintainer: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=8.0.0
pkgrel=1
pkgdesc="JavaFX visual layout tool with sereral improvements by Gluon"
arch=('any')
url="http://gluonhq.com/open-source/scene-builder/"
license=('BSD')
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
	https://s3.amazonaws.com/download.gluonhq.com/scenebuilder/$pkgver/SceneBuilder-$pkgver.jar
	$pkgname.png
        $pkgname
)
noextract=(SceneBuilder-$pkgver.jar)
sha256sums=('21f7c5c3cb053c3dc52b2ae771e6a096fa7671ab1e43d7e8bcfb180d7e51c28c'
            '963a57d2c61b23cd4a09f2d33924a0e206174e72a8c28f13a4a68f2c643827a8'
            '5dc69e3d4dcc395204567c54243105053c54e7f4633fdeac5de19aec7fc5fd1d')
prepare() {
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
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
