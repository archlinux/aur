# Maintainer: kik4444 <kik4444 at abv dot bg>

pkgname='simple-process-tracker'
pkgver=2.0.2
pkgrel=1
pkgdesc='A simple, lightweight Qt app that tracks how long user-selected processes have been running on the system'
arch=('x86_64')
url="https://github.com/kik4444/$pkgname"
license=('GPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake')
source=("https://github.com/kik4444/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f137d500c1ae811fe4e76c7ca60c3e0a8de66b16179e5e42947e9ede0db364e')

build() {
    mkdir "$srcdir/$pkgname-$pkgver/src/build-dir"
    cd "$srcdir/$pkgname-$pkgver/src/build-dir"
    cmake -S .. -B . -DCMAKE_BUILD_TYPE:STRING=Release
    make
    cat << EOF > "$srcdir/$pkgname-$pkgver/src/build-dir/$pkgname.desktop"
[Desktop Entry]
Exec=/usr/bin/$pkgname
Icon=/usr/share/icons/hicolor/scalable/apps/$pkgname-icon.svg
Name=Simple Process Tracker
StartupNotify=true
Terminal=false
Type=Application
EOF
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -m 755 "$srcdir/$pkgname-$pkgver/src/build-dir/$pkgname" "$pkgdir/usr/bin"
    install -m 644 "$srcdir/$pkgname-$pkgver/src/build-dir/$pkgname.desktop" "$pkgdir/usr/share/applications"
    install -m 644 "$srcdir/$pkgname-$pkgver/Assets/Icons/app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname-icon.svg"
}