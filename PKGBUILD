# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <bohoomil@zoho.com>

_ctan=erewhon
pkgname=(otf-$_ctan otf-$_ctan-infinality)
pkgver=1.115
pkgrel=1
pkgdesc="A font family based on Heuristica, which is based in turn on Utopia"
arch=('any')
url="http://www.ctan.org/tex-archive/fonts/$_ctan"
license=('OFL')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/fonts/$_ctan.zip"
        "45-$_ctan.conf"
        "90-non-tt-$_ctan.conf")
sha256sums=('a517b83af921e3c8a0145f8111083502e41566631eb91408128a52bd89340d61'
            'a122f645314ed9e69f55ec77aef6956e4471418baa098f232165d2fbf130aa75'
            '74a318013024001702310420fa07e06f9cbf4d4db936a76d1be981c98662c1ca')

package_otf-erewhon() {
    cd "$_ctan"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" opentype/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/OFL.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" doc/{FontLog.txt,"$_ctan"-doc.pdf}
}

package_otf-erewhon-infinality() {
    groups=('infinality-bundle-fonts-extra')
    depends=("${pkgname%-infinality}")
    provides=("${pkgname%-infinality}-ibx")
    conflicts=("${provides[@]}")
    replaces=("${provides[@]}")
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail/" [0-9]*-"$_ctan".conf
    install -dm644 "$pkgdir/etc/fonts/conf.d"
    cd "$pkgdir/etc/fonts/conf.d"
    ln -s ../conf.avail/*.conf .
}
