# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot net>
# Contributor: Daniel Menelkir <dmenelkir@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=wtf
pkgver=20230706
pkgrel=1
pkgdesc='Acronym dictionary, with additions from NetBSD and wikipedia'
arch=('any')
url='https://sourceforge.net/projects/bsdwtf/'
license=('BSD')
depends=('bash')
makedepends=('git')
source=("https://sourceforge.net/projects/bsdwtf/files/wtf-$pkgver.tar.gz"
        'https://raw.github.com/keenerd/wtf/0623381d92b2c5d3e94b00c9eb06fb5d4d85d014/acronyms.computing'
        'LICENSE')
b2sums=('9a9d3c9b58a55ee9c54568c23c727df0e7b068855a18533cfc39c91f1302ecbd40b1c2adf6f9ed59989ca32517598c394d4a485335e2c9aada4018e05560d75e'
        'e0835247970d769ac0570e51af78bc4f78ebab0d7c8c056bfafcbba133893c7de8bd26d468ac9de54d4fc5626e72d0222b53552af8b44a02324e3cb121aacd21'
        '65484e19640f8e6e08c0f97f8985ccdb7dde887f1bf963503de5c7f930e0b938dd2736408382b78e914c71b0727c0e285fc7e1496b656dd4ba958f80a3f19189')

prepare() {
    sed -i 's|/usr/share/misc/|/usr/share/wtf/|' "$srcdir/wtf-$pkgver/wtf"
}

package() {
    cd "$srcdir/wtf-$pkgver"

    install -Dm755 wtf "$pkgdir/usr/bin/wtf"
    install -Dm644 wtf.6 "$pkgdir/usr/share/man/man6/wtf.6"
    install -Dm644 acronyms "$pkgdir/usr/share/wtf/acronyms"
    install -Dm644 acronyms.comp "$pkgdir/usr/share/wtf/acronyms.comp"
    # install -Dm644 acronyms-o.fake "$pkgdir/usr/share/wtf/acronyms-o"
    install -Dm644 acronyms-o.real "$pkgdir/usr/share/wtf/acronyms-o"

    install -Dm644 "$srcdir/acronyms.computing" "$pkgdir/usr/share/wtf/acronyms.computing"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
