# Maintainer:  Kr1ss <kr1ss.x@yandex.com>

pkgname=social-engineer-toolkit-git
pkgver=7.7.9.r3.75158666e
pkgrel=2
pkgdesc='The Social-Engineer Toolkit (SET) - Development Version'
arch=('any')
url="https://github.com/trustedsec/${pkgname%-git}"
license=('custom')
makedepends=('git' 'python2')
depends=('python2-pexpect' 'python2-crypto' 'python2-requests'
         'python2-pyopenssl' 'python2-pefile' 'impacket'
         'python2-pillow' 'python2-qrcode' 'python2-beautifulsoup4')
optdepends=('metasploit')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("git+https://github.com/trustedsec/${pkgname%-git}.git"
        'setoolkit'{,.sig}
        'seproxy'{,.sig}
        'seautomate'{,.sig})
sha256sums=('SKIP'
            '1901a912bc8fcc24b8a63accaa3824b50dae5f7066dbdfa83f6f9ee3e3dfdb65' 'SKIP'
            '12014216d4249ee76b30126ab3e78862b79cab32fe663b382a579b18350a536f' 'SKIP'
            '18976b6e8a83e158b9ca175dfebe1e98fc4085129a0b20064ec54e0bc5eda1d9' 'SKIP')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf '%s' "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${pkgname%-git}"
    python2 -m compileall .
    python2 -O -m compileall .
}

package() {
    install -dm755 "${pkgdir}"/usr/{bin,share/{,doc/,licenses/}setoolkit}
    install -m755 setoolkit seproxy seautomate "${pkgdir}"/usr/bin/
    cd "${pkgname%-git}"
    install -m644 readme/LICENSE "${pkgdir}"/usr/share/licenses/setoolkit/
    install -m644 readme/* "${pkgdir}"/usr/share/doc/setoolkit/
    cp -r * "${pkgdir}"/usr/share/setoolkit/
}

