# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=tuxguitar
pkgname=${_name,,}-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Open source guitar tablature editor"
arch=(x86_64)
url="https://github.com/helge17/$_name"
license=(LGPL-2.1)
depends=("java-runtime>=9" gtk3 alsa-lib)
makedepends=(gzip)
optdepends=("fluidsynth: FluidSynth plugin support"
            "jack: Jack plugin support"
            "lilv: LV2 plugin support"
            "lilypond: Compile exported LilyPond files"
            "lv2: LV2 plugin support"
            "qt5-base: LV2 plugin support"
            "suil: LV2 plugin support")
replaces=(tuxguitar)
source=("$_name-$pkgver-linux-swt-amd64.tar.gz::$url/releases/download/$pkgver/tuxguitar-$pkgver-linux-swt-amd64.tar.gz")

package() {
    cd "$srcdir/$_name-$pkgver-linux-swt-amd64"
    gzip share/man/man1/tuxguitar.1
    mkdir -p "$pkgdir/opt/tuxguitar"
    cp -a * "$pkgdir/opt/tuxguitar"

    cd "$pkgdir"
    mkdir -p usr/bin
    mkdir -p usr/share/{applications,man/man1,mime/packages,pixmaps}

    ln -s /opt/tuxguitar/tuxguitar.sh usr/bin/tuxguitar
    ln -s /opt/tuxguitar/share/applications/tuxguitar.desktop usr/share/applications/
    ln -s /opt/tuxguitar/share/mime/packages/tuxguitar.xml usr/share/mime/packages/
    ln -s /opt/tuxguitar/share/pixmaps/tuxguitar.png usr/share/pixmaps/
    ln -s /opt/tuxguitar/share/man/man1/tuxguitar.1.gz usr/share/man/man1/tuxguitar.1.gz
}
sha256sums=('3755020c0072cc5a0d9571348aa71c2ca83e5873f5dc611a39b3342d5b73fe86')
