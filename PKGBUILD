# Maintainer: Alexandre Leconte <aleconte@dwightstudio.fr>
pkgname=jarmemu
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple ARMv7 simulator written in Java, intended for educational purpose"
arch=('any')
url="https://dwightstudio.fr/jarmemu"
license=('GPL-3')
groups=()
depends=()
makedepends=("java-environment>=21" "maven" "desktop-file-utils" "xdg-utils")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# TODO: Use portable archive instead
source=("https://github.com/Dwight-Studio/JArmEmu/releases/download/v$pkgver/JArmEmu-$pkgver.zip")
noextract=()
sha256sums=("07766f6e9822d01eae60e7a44ba67440dd081dba9fe70e8e4a6ae9d301a5614f")

build() {
    cd $srcdir/jarmemu
}

package() {
    cd $srcdir/jarmemu

    install -d  $pkgdir/usr/share/java/$pkgname/
    install -Dm 644 *.jar $pkgdir/usr/share/java/$pkgname/
    install -Dm 644 lib/* -t $pkgdir/usr/share/java/$pkgname/lib/
    install -Dm 755 resources/$pkgname $pkgdir/usr/bin/$pkgname

    install -Dm 644 resources/icons/hicolor/scalable/apps/fr.dwightstudio.JArmEmu.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/fr.dwightstudio.JArmEmu.svg
    install -Dm 644 resources/mime/packages/fr.dwightstudio.JArmEmu.xml $pkgdir/usr/share/mime/packages/fr.dwightstudio.JArmEmu.xml
    install -Dm 644 resources/metainfo/fr.dwightstudio.JArmEmu.metainfo.xml $pkgdir/usr/share/metainfo/fr.dwightstudio.JArmEmu.metainfo.xml

    desktop-file-install --dir=$pkgdir/usr/share/applications resources/fr.dwightstudio.JArmEmu.desktop
    xdg-desktop-icon install --novendor resources/fr.dwightstudio.JArmEmu.desktop

    depends=("java-runtime>=21")
}
