# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=doccli
pkgver=2.10
pkgrel=2
pkgdesc='CLI do oglądania anime z docchi.pl'
arch=('any')
url="https://github.com/TowarzyszFatCat/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "$pkgname.sh")
sha256sums=('2dcd98f8e052074e8e4669a7f65e96604ac591cd263f0dd182cb321ddc5bcfe3'
            'ad3b7d1446c6182101d541a53940c8d0996d84f98787b328b3f3ede28bef7238')
depends=('mpv' 'yt-dlp' 'python>=3.9')

build() {
    cd "$pkgname-$pkgver"

    python3 -m venv venv
    source venv/bin/activate
    pip install requests yt-dlp inquirerpy termcolor
    pip install https://github.com/qwertyquerty/pypresence/archive/master.zip
    deactivate
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 *.py -t "$pkgdir/usr/lib/$pkgname"
    cp -r venv "$pkgdir/usr/lib/$pkgname/venv"

    install -Dm0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm0755 "${pkgname}_skip.lua" -t "$pkgdir/usr/share/mpv/scripts"

    install -Dm644 icon.ico "$pkgdir/usr/share/icons/$pkgname.ico"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 DISCLAIMER.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
