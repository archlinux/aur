# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=Nero-umu
_QTver=Qt6
pkgname=nero-umu
pkgver=1.1.4
pkgrel=1
pkgdesc='A fast and efficient umu manager, just as the Romans designed.'
arch=('x86_64')
url='https://github.com/SeongGino/Nero-umu'
license=('GPL-3.0-only')
depends=('qt6-base' 'icu' 'umu-launcher')
makedepends=('cmake')
optdepends=(
            'curl: For downloading external files to install into prefixes'
            'icoextract: Extract Windows ico files'
            'icoutils: Convert contents of ico files'
            'winetricks: Fallback for Proton runners without embedded protonfixes'
)
source=("git+https://github.com/SeongGino/Nero-umu#tag=v${pkgver}")
md5sums=('4c9e95df2f98ce0240d92a09c78d4e31')

prepare() {
  cd "$srcdir/$_name"
  git submodule update --init
}

build() {
  cmake -B "$srcdir/$_name/build" -DCMAKE_BUILD_TYPE=Release -DNERO_QT_VERSION=$_QTver -S "$srcdir/$_name"
  cmake --build "$srcdir/$_name/build" --config Release
}

package() {
  install -Dm755 "$srcdir/$_name/build/nero-umu" "$pkgdir/usr/bin/nero-umu"
  install -Dm755 "$srcdir/$_name/img/ico/ico_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name/img/ico/ico_48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name/img/ico/ico_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name/img/ico/ico_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name/xyz.TOS.Nero.desktop" "$pkgdir/usr/share/applications/xyz.TOS.Nero.desktop"
}
