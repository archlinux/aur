pkgname=passphraseme-git
pkgrel=5
pkgver=0.1.4
pkgdesc="A quick and simple cryptographically secure script to generate high entropy passphrases using EFF's wordlists"
url="https://github.com/micahflee/passphraseme"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python')
source=("git+https://github.com/micahflee/passphraseme.git")
sha1sums=('SKIP')
pkgver() {
    cd "passphraseme"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
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
