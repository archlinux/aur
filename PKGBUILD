# Maintainer filotek <fernandes.fd at gmail.com>
# Contributor 5amu <v.casalino at protonmail.com>

pkgname=wordlists
pkgver=0.3
pkgrel=1
pkgdesc="Download a great set of wordlists. In /usr/share/wordlists"
license=('MIT' 'GPLv2')
arch=('any')
source=(
    "https://gitlab.com/kalilinux/packages/dirbuster/-/archive/kali/1.0-1kali4/dirbuster-kali-1.0-1kali4.tar.gz"
    "https://gitlab.com/kalilinux/packages/dirb/-/archive/debian/2.22-0kali3/dirb-debian-2.22-0kali3.tar.gz"
    "https://github.com/xmendez/wfuzz/archive/refs/tags/v3.1.0.tar.gz"
    "https://github.com/danielmiessler/SecLists/archive/refs/tags/2022.4.tar.gz"
)
sha256sums=(
    "32603661e7d8ac8e60dcd8f1a3cca732065720cc1a5a80f075509affcca8a4bf"
    "5c52611cf3b58b6e5855e7f3a6cf28da324ccf820d89920b89488d9b5bc1cba1"
    "60798e56274a377f8770d162935a040d4d6e27919bfbb46cf13a7a0a34896be9"
    "3d61246b2f5405df97a3b4d962f299559091c2e40ccec6af8d820fe82093ece5"
)

prepare() {
    find $srcdir -type f -name "*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
    install -dm755 $pkgdir/usr/share/wordlists/
    mkdir -p $pkgdir/usr/share/wordlists/dirbuster
    cp -r $srcdir/dirbuster-kali-1.0-1kali4/*.txt $pkgdir/usr/share/wordlists/dirbuster
    # No license here
    mkdir -p $pkgdir/usr/share/wordlists/dirb
    cp -r $srcdir/dirb-debian-2.22-0kali3/wordlists/* $pkgdir/usr/share/wordlists/dirb
    install -Dm644 $srcdir/dirb-debian-2.22-0kali3/LICENSE.txt $pkgdir/usr/share/licenses/wordlists/dirb/LICENSE
    mkdir -p $pkgdir/usr/share/wordlists/wfuzz
    cp -r $srcdir/wfuzz-3.1.0/wordlist/* $pkgdir/usr/share/wordlists/wfuzz
    install -Dm644 $srcdir/wfuzz-3.1.0/LICENSE $pkgdir/usr/share/licenses/wordlists/wfuzz/LICENSE
    mkdir -p $pkgdir/usr/share/wordlists/seclists
    cp -r $( find $srcdir/SecLists-2022.4/* -maxdepth 0 -type d) $pkgdir/usr/share/wordlists/seclists
    install -Dm644 $srcdir/SecLists-2022.4/LICENSE $pkgdir/usr/share/licenses/wordlists/seclists/LICENSE
    find $pkgdir/usr/share/wordlists -type f -exec chmod 644 \{\} \;
}
