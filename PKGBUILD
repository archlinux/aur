pkgname=passphraseme
pkgrel=1
pkgver=0.1.5
_commit=569c3167167993326618689f87c7e0ea0e716699
pkgdesc="A quick and simple cryptographically secure script to generate high entropy passphrases using EFF's wordlists"
url="https://github.com/micahflee/passphraseme"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python')
source=("git+https://github.com/micahflee/passphraseme.git#commit=${_commit}")
sha1sums=('SKIP')
build() {
    cd "passphraseme"
    sed -i passphraseme/__init__.py -e '1 s/^\#!\/usr\/bin\/env python3$/\#!\/usr\/bin\/python3/g'
    sed -i passphraseme/__init__.py -e 's/os.path.dirname(os.path.abspath(/os.path.dirname(os.path.realpath(/g'
}
package() {
    cd "passphraseme"
    mkdir -p "${pkgdir}/usr/share/passphraseme" "${pkgdir}/usr/bin"
    cp -r passphraseme/__init__.py passphraseme/wordlists/ "${pkgdir}/usr/share/passphraseme"
    ln -s /usr/share/passphraseme/__init__.py "${pkgdir}/usr/bin/passphraseme"
}
