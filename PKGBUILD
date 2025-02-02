# Maintainer: almezali <mzmcsmzm@gmail.com>

pkgname=mtsp-music-player
pkgver=1.0.13
pkgrel=1
pkgdesc="MTSP - Multimedia Terminal Soundtrack Player"
arch=('x86_64')
url="https://gitlab.com/mtsp/mtsp-music-player"
license=('GPL')

source=("https://gitlab.com/mtsp/mtsp-music-player/-/blob/main/mtsp-music-player.tar.gz")
sha256sums=('SKIP')

prepare() {
    # فك الأرشيف
    tar -xvf mtsp-music-player.tar.gz -C "$srcdir"

    # الانتقال إلى الدليل الذي تم فك الأرشيف فيه
    cd "$srcdir/$pkgname-$pkgver" || exit

    # إذا كان هناك PKGBUILD داخل الأرشيف، يمكنك استخدامه
    if [[ -f PKGBUILD ]]; then
        cp PKGBUILD "$srcdir/PKGBUILD.internal"
    else
        error "لم يتم العثور على PKGBUILD داخل الأرشيف!"
        exit 1
    fi
}

build() {
    # استخدام PKGBUILD الموجود داخل الأرشيف
    cd "$srcdir/$pkgname-$pkgver" || exit
    makepkg --nobuild
}

package() {
    # استخدام PKGBUILD الموجود داخل الأرشيف
    cd "$srcdir/$pkgname-$pkgver" || exit
    makepkg --noextract --nodeps --install --pkg "$pkgdir"

}
