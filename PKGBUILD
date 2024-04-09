# Maintainer filotek <fernandes.fd at gmail.com>
# Contributor 5amu <v.casalino at protonmail.com>

pkgname=wordlists
pkgver=0.4
pkgrel=1
pkgdesc="Download a great set of wordlists. In /usr/share/wordlists"
license=('MIT' 'GPLv2')
arch=('any')
source=(
    "https://gitlab.com/kalilinux/packages/dirbuster/-/archive/kali/1.0-1kali6/dirbuster-kali-1.0-1kali6.tar.gz"
    "https://gitlab.com/kalilinux/packages/dirb/-/archive/debian/2.22-0kali3/dirb-debian-2.22-0kali3.tar.gz"
    "https://github.com/xmendez/wfuzz/archive/refs/tags/v3.1.0.tar.gz"
    "https://github.com/danielmiessler/SecLists/archive/refs/tags/2024.1.tar.gz"
)
sha256sums=(
    "b397fe95327efcbc66946a159f98a1c78c4a4c688ce747cd3545d2f8796cbf2d"
    "5c52611cf3b58b6e5855e7f3a6cf28da324ccf820d89920b89488d9b5bc1cba1"
    "60798e56274a377f8770d162935a040d4d6e27919bfbb46cf13a7a0a34896be9"
    "bc804ddebd1e8ccc6fde885406e2614c9c1ebe052052ae79bcd9f62f96ddad9f"
)

prepare() {
    find $srcdir -type f -name "*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
    install -dm755 $pkgdir/usr/share/wordlists/
    mkdir -p $pkgdir/usr/share/wordlists/dirbuster
    cp -r $srcdir/dirbuster-kali-1.0-1kali6/*.txt $pkgdir/usr/share/wordlists/dirbuster
    # No license here
    mkdir -p $pkgdir/usr/share/wordlists/dirb
    cp -r $srcdir/dirb-debian-2.22-0kali3/wordlists/* $pkgdir/usr/share/wordlists/dirb
    install -Dm644 $srcdir/dirb-debian-2.22-0kali3/LICENSE.txt $pkgdir/usr/share/licenses/wordlists/dirb/LICENSE
    mkdir -p $pkgdir/usr/share/wordlists/wfuzz
    cp -r $srcdir/wfuzz-3.1.0/wordlist/* $pkgdir/usr/share/wordlists/wfuzz
    install -Dm644 $srcdir/wfuzz-3.1.0/LICENSE $pkgdir/usr/share/licenses/wordlists/wfuzz/LICENSE
    mkdir -p $pkgdir/usr/share/wordlists/seclists
    cp -r $( find $srcdir/SecLists-2024.1/* -maxdepth 0 -type d) $pkgdir/usr/share/wordlists/seclists
    install -Dm644 $srcdir/SecLists-2024.1/LICENSE $pkgdir/usr/share/licenses/wordlists/seclists/LICENSE
    find $pkgdir/usr/share/wordlists -type f -exec chmod 644 \{\} \;
}
