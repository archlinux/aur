# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Author :      Christian Rebischke <chris.rebischke[at]archlinux[dot]org>


pkgname=social-engineer-toolkit

pkgver=8.0.1
pkgrel=1

pkgdesc='The Social-Engineer Toolkit (SET)'
arch=('any')
url="https://github.com/trustedsec/${pkgname}"
license=('custom')

makedepends=('python2')
depends=('python2-pexpect' 'python2-crypto' 'python2-requests'
         'python2-pyopenssl' 'python2-pefile' 'impacket'
         'python2-pillow' 'python2-qrcode' 'python2-beautifulsoup4')
optdepends=('metasploit')

options=('!strip')

source=("https://github.com/trustedsec/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('23a4fe1de24b746f18aa0790f14ddda7d4d70b95071abbd3ae8cedf36268367b')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -si '1s/python/python2/' se{toolkit,proxy,automate,update}
}

build() {
    cd "${pkgname}-${pkgver}"
    python2 -O -m compileall .
    find src -name __init__.pyo -delete
}

package() {
    cd "${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/"{bin,share/{{,licenses/}setoolkit,doc}}
    cp -a --no-preserve=ownership * "${pkgdir}/usr/share/setoolkit/"
    mv "${pkgdir}/usr/share/setoolkit/readme" "$pkgdir/usr/share/doc/setoolkit"
    mv "${pkgdir}/usr/share/setoolkit/README.md" "$pkgdir/usr/share/doc/setoolkit/"
    ln -s /usr/share/doc/setoolkit/LICENSE "${pkgdir}/usr/share/licenses/setoolkit/"
    ln -s /usr/share/setoolkit/{setoolkit,seproxy,seautomate} "${pkgdir}/usr/bin/"
}

# vim: ts=4 sw=4 et:
