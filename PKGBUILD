# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=acc
pkgver=1.58
pkgrel=1
pkgdesc='ACS script compiler for use with ZDoom and/or Hexen'
arch=('i686' 'x86_64')
url='https://github.com/rheit/acc'
license=('custom:EULA')
depends=('glibc')
makedepends=('cmake')
source=("http://zdoom.org/files/utils/acc/acc${pkgver//./}src.zip"
        'http://www.doomworld.com/eternity/activision_eula.txt')
sha256sums=('d208c4026d0f6b8467c2212463c73a9716e545f0160f7b00671284ba02a2c634'
            'd1dd96235e883c638e202715039946fac58f2979e1f11cb2bbe2a24eefb5fe9a')

prepare() {
    sed -ri "s|/usr/local/share/acc|/usr/share/acc|" acc.c
}

build() {
    mkdir -p build
    cmake -B build -D CMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    install -d "$pkgdir"/usr/bin/ \
               "$pkgdir"/usr/share/acc/ \
               "$pkgdir"/usr/share/licenses/$pkgname/

    install build/acc "$pkgdir"/usr/bin/

    install -m644 zcommon.acs "$pkgdir"/usr/share/acc/
    install -m644 zdefs.acs "$pkgdir"/usr/share/acc/
    install -m644 zspecial.acs "$pkgdir"/usr/share/acc/
    install -m644 zwvars.acs "$pkgdir"/usr/share/acc/

    install -m644 "$srcdir"/activision_eula.txt \
                  "$pkgdir"/usr/share/licenses/$pkgname/
}
