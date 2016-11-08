# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=acc
pkgver=1.55
pkgrel=1
pkgdesc='ACS script compiler for use with ZDoom and/or Hexen'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('custom:EULA')
depends=('glibc')
source=("http://zdoom.org/files/utils/acc/acc${pkgver//./}-src.zip"
        "http://zdoom.org/files/utils/acc/acc${pkgver//./}win.zip"
        'http://www.doomworld.com/eternity/activision_eula.txt')
sha256sums=('6483eb26016aeae95e9abb51d1b3a815400ac277d4e1013d269ac4342e2f11dc'
            '92a3815112d1a0b8334f9ed67a8a169ef788ea4c897177c0476a3eb772c48bd6'
            'd1dd96235e883c638e202715039946fac58f2979e1f11cb2bbe2a24eefb5fe9a')

prepare() {
    sed -ri "s|/usr/local/share/acc|/usr/share/acc|" acc.c
}

build() {
    make
}

package() {
    install -d "$pkgdir"/usr/bin/ \
               "$pkgdir"/usr/share/acc/ \
               "$pkgdir"/usr/share/licenses/$pkgname/

    install acc "$pkgdir"/usr/bin/

    install -m644 zcommon.acs "$pkgdir"/usr/share/acc/
    install -m644 zdefs.acs "$pkgdir"/usr/share/acc/
    install -m644 zspecial.acs "$pkgdir"/usr/share/acc/
    install -m644 zwvars.acs "$pkgdir"/usr/share/acc/

    install -m644 activision_eula.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
