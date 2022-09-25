# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=0.2.1
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64')
url='https://github.com/svt/vivictpp'
license=('GPL2')
depends=('sdl2'
         'sdl2_ttf'
         'ffmpeg'
         'cli11'
         'fmt')
makedepends=('meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/svt/vivictpp/archive/refs/tags/v${pkgver}.zip"
        "disable-logPacket.patch"
        "dependencies-meson.build.patch")
sha256sums=('eb99feb8757a82c7b291d1ade4e152487a6fbb838fa765f444f4c6ae1fb86143'
            'fe42b5a7ff5f13eb221ef4eba1dbfcf82f9b64e109a120b6c6774c1a6e5fb801'
            '7d44b7db491739589ce2e93be3a2fadf728de9fd3ae703ba9067b029725838c4')

prepare() {
    patch --directory="${pkgname}-${pkgver}" --forward --strip=2 --input="${srcdir}/disable-logPacket.patch"
    patch --directory="${pkgname}-${pkgver}" --forward --strip=2 --input="${srcdir}/dependencies-meson.build.patch"
}

build() {
    meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}-${pkgver}" "builddir"
    meson compile -C builddir
}

package() {
    meson install -C builddir --destdir "$pkgdir"
}
