# Maintainer: Eugene Dvoretsky <radioxoma at gmail dot com>
pkgname=pilorama-git
pkgver=v3.0.3.r5.g805a363
pkgrel=1
epoch=
pkgdesc="Advanced timeboxing pomodoro timer"
arch=('x86_64')
url="https://github.com/eplatonoff/pilorama"
license=('GPLv3')
groups=()
depends=('qt5-svg' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-multimedia')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('pilorama')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/eplatonoff/pilorama")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    sed -i 's/TARGET=Pilorama/TARGET=pilorama/g' src/pilorama.pro
    qmake src/pilorama.pro
    make
}

package() {
    cd "$srcdir/$pkgname"
    make INSTALL_ROOT="$pkgdir" install

    for res in '8x8' '16x16' '20x20' '22x22' '24x24' '32x32' '36x36' '40x40' '42x42' '48x48' '64x64' '72x72' '80x80' '96x96' '192x192' '128x128' '256x256' '384x384' '512x512' ;
      do
        install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/hicolor/${res}.png" "$pkgdir/usr/share/icons/hicolor/${res}/apps/pilorama.png"
      done

    install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/hicolor/app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pilorama.svg"
    install -Dm644 "$srcdir/$pkgname/src/pilorama.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
