# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=swhkd-bin
pkgver=1.2.1
pkgrel=6
pkgdesc='sxhkd clone for Wayland, X11 or TTY. Written in Rust.'
arch=(x86_64)
url='https://github.com/waycrate/swhkd'
license=(BSD)
depends=(polkit)
provides=(swhkd)
conflicts=(swhkd swhkd-git swhkd-musl-git)
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/glibc-x86_64-.zip"
        'https://raw.githubusercontent.com/waycrate/swhkd/19db3259a5f24e3c4395bbfeb3cfad8709d14f18/com.github.swhkd.pkexec.policy'
        'https://raw.githubusercontent.com/waycrate/swhkd/3b19fc33b32efde88311579152a1078a8004397c/LICENSE'
        'https://raw.githubusercontent.com/waycrate/swhkd/3b19fc33b32efde88311579152a1078a8004397c/README.md'
        'https://raw.githubusercontent.com/waycrate/swhkd/3b19fc33b32efde88311579152a1078a8004397c/CHANGELOG.md'
        'https://raw.githubusercontent.com/waycrate/swhkd/3b19fc33b32efde88311579152a1078a8004397c/docs/swhks.1.scd'
        'https://raw.githubusercontent.com/waycrate/swhkd/3b19fc33b32efde88311579152a1078a8004397c/docs/swhkd.1.scd'
        'https://raw.githubusercontent.com/waycrate/swhkd/3b19fc33b32efde88311579152a1078a8004397c/docs/swhkd.5.scd'
        'https://raw.githubusercontent.com/waycrate/swhkd/3b19fc33b32efde88311579152a1078a8004397c/docs/swhkd-keys.5.scd'
        )
sha256sums=('4de7d4a63679291f2956fae8eab5c117ce51be39d6f591000c612464251ae011'
            '3eee83632e7a8c2fb9d1fb7748af0d49739f9585df0e5d4f8d0249ef4594ec47'
            '49fc501991df7eda36e9613409a03d9a596fc6cd7cb00a4c0fffa21af9e9ed0a'
            '1764ac0d2292292e4f39c19404afa263acbf946bbd72ebe0f951fef43a01713c'
            '605e85ccea37e8053211b1426ceb85a0775b579fc3a0147d905fdbcec09d84aa'
            'd637f6b3342bb2691c019127825f2c805a103957a8cba33590aecad1a770be6d'
            '0e989110ba010f3394f5baf4206b1f467c9b31a02b538ab11a0e7dfb17d75eb8'
            'da3baebf36a0efd4c9dcb270d5a8980b4890a93ca2de508ecc7f5232fe072884'
            '731a38b9bef38976044984561a244f9754bdd8f0fafe14edd181b3685895b242')

package() {
    # binaries
    cd "$srcdir"/target/release
    install -Dm 755 swhkd "$pkgdir/usr/bin/swhkd"
    install -Dm 755 swhks "$pkgdir/usr/bin/swhks"

    # polkit
    cd "$srcdir"
    install -Dm 644 com.github.swhkd.pkexec.policy -t "$pkgdir/usr/share/polkit-1/actions"

    # LICENSE
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # docs
    for md in *.{md,scd} ; do
        install -Dm 644 "$md" -t "$pkgdir/usr/share/doc/swhkd"
    done
}

