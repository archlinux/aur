# Maintainer: Jerzy Mansarliński <jerzy at mansar dot eu>

pkgname=tshotkeytrigger
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool that triggers hotkey actions in Teamspeak 6 via TeamSpeak Remote Applications API."
arch=(x86_64)
url=https://github.com/jmansar/tshotkeytrigger
license=(MIT)
depends=(
    'libwebsockets' 
    'glibc'
)
makedepends=(
    'meson' 
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    )
sha256sums=(
    '45eb5965f91c3ac0581164969eddf028580faf4ba160f3d1831e560b54dc4399' 
    )

build () {
    cd "${pkgname}-${pkgver}"

    meson setup builddir --buildtype=release
    meson compile -C builddir
}

package () {
    cd "${pkgname}-${pkgver}"

    install -Dm755 ./builddir/tshotkeytrigger ${pkgdir}/usr/bin/tshotkeytrigger
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
