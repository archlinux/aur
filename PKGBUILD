# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=social-engineer-toolkit-git

pkgver() { git -C "${pkgname%-git}" describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=8.0.3.r4.bc1459567
pkgrel=1

pkgdesc='The Social-Engineer Toolkit (SET) - Development Version'
arch=('any')
url="https://github.com/trustedsec/${pkgname%-git}"
license=('BSD')

makedepends=('git' 'python2')
depends=('python2-pexpect' 'python2-crypto' 'python2-requests'
         'python2-pyopenssl' 'python2-pefile' 'impacket'
         'python2-pillow' 'python2-qrcode' 'python2-beautifulsoup4')
optdepends=('metasploit')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

options=('!strip')

changelog=CHANGELOG
source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
    cd "${pkgname%-git}"
    sed -si '1s/python3/python2/' se{toolkit,proxy,automate,update}
}

build() {
    cd "${pkgname%-git}"
    python2 -O -m compileall .
    find src -name __init__.pyo -delete
}

package() {
    cd "${pkgname%-git}"
    install -dm755 "$pkgdir/usr/"{bin,share/{,doc/,licenses/}setoolkit}
    cp -a --no-preserve=ownership * "$pkgdir/usr/share/setoolkit/"
    ln -s /usr/share/setoolkit/readme/* "$pkgdir/usr/share/doc/setoolkit/"
    ln -s /usr/share/setoolkit/README.md "$pkgdir/usr/share/doc/setoolkit/"
    ln -s /usr/share/doc/setoolkit/LICENSE "$pkgdir/usr/share/licenses/setoolkit/"
    ln -s /usr/share/setoolkit/se{toolkit,proxy,automate} "$pkgdir/usr/bin/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
