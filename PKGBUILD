# Maintainer: Eugene Dvoretsky <radioxoma at gmail dot com>
pkgname=pilorama-git
pkgver=2.0.r42.g31f60c3
pkgrel=1
epoch=
pkgdesc="Advanced timeboxing pomodoro timer"
arch=('x86_64')
url="https://github.com/eplatonoff/pilorama"
license=('GPLv3')
groups=()
depends=('qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-multimedia')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('pilorama')
conflicts=('pilorama')
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

prepare() {
  cd "$srcdir/$pkgname/src/assets/app_icons"
  icns2png -x -s 48x48 icon.icns  # Extract icon_48x48x32.png
}

build() {
    cd "$srcdir/$pkgname"
    qmake src/pilorama.pro 
    make
}

package() {
    cd "$srcdir/$pkgname"
    make INSTALL_ROOT="$pkgdir" install
    # install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/icon_16x16x32.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/pilorama.png"
    # install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/icon_32x32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/pilorama.png"
    install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/icon_48x48x32.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/pilorama.png"  # Important
    # install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/icon_128x128x32.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pilorama.png"
    # install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/icon_256x256x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pilorama.png"
    # install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/icon_512x512x32.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pilorama.png"
    # install -Dm644 "$srcdir/$pkgname/src/assets/app_icons/hicolor/app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pilorama.svg"
    install -Dm644 "$srcdir/$pkgname/src/pilorama.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
