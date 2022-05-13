# Maintainer: Mario Mansilla <mariomanfer@gmail.com>
pkgname=gpp-decrypt-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="gpp-decrypt fixed for arch."
arch=(x86_64 i686)
url="https://github.com/t0thkr1s/gpp-decrypt.git"
license=('GPL')
groups=()
depends=()
makedepends=(git python3 python-pip gcc)
checkdepends=()
optdepends=()
provides=(gpp-decrypt)
conflicts=()
replaces=()
backup=()
options=()
install=gpp-decrypt.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
        cd "${_pkgname}"
        printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        sudo pip3 install pycrypto
        sudo pip3 install colorama
}

package() {
        cd gpp-decrypt
        mv gpp-decrypt.py gpp-decrypt.py.tmp
        cat gpp-decrypt.py.tmp | sed 's/iv = .* \* 16/iv = b"\\x00" \* 16/g' > gpp-decrypt.py
        chmod +x gpp-decrypt.py
        sudo cp gpp-decrypt.py /usr/bin/gpp-decrypt
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
}
