# The MIT License (MIT)
# Copyright © 2026 Yalçın Mete Kızılgün

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Maintainer: Yalçın Mete Kızılgün <kizilgunmete@gmail.com>
pkgname=ekipyt-en
pkgver=1.0
pkgrel=1
pkgdesc="Minimal and secure authorization tool, with onpass, English and custom PAM service."
arch=('x86_64')
url="" 
license=('MIT')
depends=('pam')
sha256sums=('6dc94b6e9f7d9170737df7d0ba65ee0308a263ecb8150c949047428371dee8a8'
            '146e04aa05345680dd6c220630390432bf45009fcf94a347131d9c311875027e'
            'dc17b21c82ef63f4351cb66b8f1a3324843eef82404790773796c1f1ac6aefa3')
source=("yt.c" "yt.cfg" "yt.pam")
install=ekipyt.install

build() {
    gcc -Wall -O2 -o yt yt.c -lpam -lpam_misc
}

package() {
    # Binary kur
    install -Dm755 yt "$pkgdir/usr/bin/yt"

    # Root-only config, default onepass
    install -Dm600 yt.cfg "$pkgdir/etc/yt.cfg"
    chown root:root "$pkgdir/etc/yt.cfg"

    # Onepass dizini (boş)
    install -d -m700 "$pkgdir/tmp/yt_onepass"

    # PAM servisi kur
    install -Dm644 yt.pam "$pkgdir/etc/pam.d/yt"
    chown root:root "$pkgdir/etc/pam.d/yt"
}
