# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Author :      Christian Rebischke <chris.rebischke[at]archlinux[dot]org>


pkgname=social-engineer-toolkit

pkgver=8.0.3
pkgrel=1

pkgdesc='The Social-Engineer Toolkit (SET)'
arch=('any')
url="https://github.com/trustedsec/$pkgname"
license=('BSD')

makedepends=('python2')
depends=('python2-pexpect' 'python2-crypto' 'python2-requests'
         'python2-pyopenssl' 'python2-pefile' 'impacket'
         'python2-pillow' 'python2-qrcode' 'python2-beautifulsoup4')
optdepends=('metasploit')

options=('!strip')

changelog=CHANGELOG
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('ba07e90ac461c3fe5ac1582875699bd3247c7168ea7ee9ae34f2a51199437c08')

prepare() {
    cd "$pkgname-$pkgver"
    sed -si '1s/python/python2/' se{toolkit,proxy,automate,update}
}

build() {
    cd "$pkgname-$pkgver"
    python2 -O -m compileall .
    find src -name __init__.pyo -delete
}

package() {
    cd "$pkgname-$pkgver"
    install -dm755 "$pkgdir/usr/"{bin,share/{,doc/,licenses/}setoolkit}
    cp -a --no-preserve=ownership * "$pkgdir/usr/share/setoolkit/"
    ln -s /usr/share/setoolkit/readme/* "$pkgdir/usr/share/doc/setoolkit/"
    ln -s /usr/share/setoolkit/README.md "$pkgdir/usr/share/doc/setoolkit/"
    ln -s /usr/share/doc/setoolkit/LICENSE "$pkgdir/usr/share/licenses/setoolkit/"
    ln -s /usr/share/setoolkit/se{toolkit,proxy,automate} "$pkgdir/usr/bin/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
