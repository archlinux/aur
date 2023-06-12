# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=swhkd-bin
pkgver=1.2.1
pkgrel=2
pkgdesc='sxhkd clone for Wayland, X11 or TTY. Written in Rust.'
arch=(x86_64)
url='https://github.com/waycrate/swhkd'
license=(BSD)
depends=(polkit)
provides=(swhkd)
conflicts=(swhkd-git swhkd-musl-git)
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/glibc-x86_64-.zip"
        'https://raw.githubusercontent.com/waycrate/swhkd/19db3259a5f24e3c4395bbfeb3cfad8709d14f18/com.github.swhkd.pkexec.policy'
        'https://github.com/waycrate/swhkd/blob/3b19fc33b32efde88311579152a1078a8004397c/LICENSE'
        'https://github.com/waycrate/swhkd/blob/3b19fc33b32efde88311579152a1078a8004397c/README.md'
        'https://github.com/waycrate/swhkd/blob/3b19fc33b32efde88311579152a1078a8004397c/CHANGELOG.md'
        'https://github.com/waycrate/swhkd/blob/3b19fc33b32efde88311579152a1078a8004397c/docs/swhks.1.scd'
        'https://github.com/waycrate/swhkd/blob/3b19fc33b32efde88311579152a1078a8004397c/docs/swhkd.1.scd'
        'https://github.com/waycrate/swhkd/blob/3b19fc33b32efde88311579152a1078a8004397c/docs/swhkd.5.scd'
        'https://github.com/waycrate/swhkd/blob/3b19fc33b32efde88311579152a1078a8004397c/docs/swhkd-keys.5.scd'
        )
sha256sums=('4de7d4a63679291f2956fae8eab5c117ce51be39d6f591000c612464251ae011'
            '3eee83632e7a8c2fb9d1fb7748af0d49739f9585df0e5d4f8d0249ef4594ec47'
            '8ed8175528edfe5d73fd144003e66709a8abdd06dbbbf2212c4c8609b234ca2c'
            '512ff5c7051f26b37ed59e576d8772968b8c484c37a73d7ebfb0ac09cb0e242a'
            'd9fa5ee0bab0da3ace57625d5fdd3fd693b8aee1b282cb6adff433a83137de5a'
            '730d9774f6f9ad94118b401b0141cce17595a0d0b8e9fb7c8fef04cf94a641b9'
            '59575a64fdc89fc62334e7eb13740672e0652c1b11e7eb2ea38150ec30e633d6'
            'a626ca28d1d282b35ec63985f8efc5754b5301885f14c4162e16342295717366'
            '692b5c52728bde3582d490dc8523147dab7ecde09272032a66eeb0fcb7d5c969')

package() {
    # binaries
    cd "$srcdir"/target/release
    install -Dm 755 swhkd "$pkgdir/usr/bin/swhkd"
    install -Dm 755 swhks "$pkgdir/usr/bin/swhks"

    # polkit
    cd "$srcdir"
    install -Dm 644 com.github.swhkd.pkexec.policy -t "$pkgdir/usr/share/polkit-1/actions"

    # LICENSE
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licences/swhkd"

    # docs
    for md in *.{md,scd} ; do
        install -Dm 644 "$md" -t "$pkgdir/usr/share/doc/swhkd"
    done
}

