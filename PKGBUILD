# Maintainer: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=8.1.1
pkgrel=3
pkgdesc="JavaFX visual layout tool with sereral improvements by Gluon"
arch=('any')
url="http://gluonhq.com/open-source/scene-builder/"
license=('Oracle BSD License')
groups=()
depends=('bash' 'java-environment')
makedepends=('')
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
        $pkgname.desktop
        $pkgname
)
noextract=(SceneBuilder-$pkgver.jar)
sha256sums=('189c2ecd20e9258a797c7e604d2ec735ca92f48036a7a5d363cad2ea20702064'
            'd50d10cafeb801582bd9b30500a04a1b36e4589f1ad2243722107a1eec4ce80a'
            '5dc69e3d4dcc395204567c54243105053c54e7f4633fdeac5de19aec7fc5fd1d')
prepare=()
package() {
  bsdcpio --extract --make-directories LICENSE "com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png" < SceneBuilder-$pkgver.jar 

  # copy files
  cd "$srcdir"
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 SceneBuilder-$pkgver.jar "$pkgdir/opt/$pkgname/$pkgname.jar"
  install -m755 $pkgname "$pkgdir/usr/bin/$pkgname"  
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop" 
  install -Dm644 "com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
