# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=chatbox-bin
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://github.com/Bin-Huang/chatbox"
license=('GPL')
groups=()
depends=(electron)
makedepends=()
checkdepends=()
optdepends=()
provides=(chatbox)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Bin-Huang/chatbox/releases/download/v${pkgver}/chatbox_${pkgver}_amd64.deb"
chatbox)
noextract=()
sha256sums=('6d915ea3a99945268bbcfe3266d3de2d56d42ce6dd74c1ec0b8f6796889dd668'
            '0bc0ea7b2e9bf0a56f51e45afc74c34bf7ecfa5ea602905abed5b93495aee637')
validpgpkeys=()

package() {
    tar -xvpf data.tar.xz -C $pkgdir
    for i in $pkgdir/usr/lib/chatbox/*;
    do
        local fname=$(basename ${i})
        if [ "$fname" != "resources" ] && [ "$fname" != "LICENSES.chromium.html" ] && [ "$fname" != "version" ];
        then
            rm -rf "$i"
        fi
    done
    rm $pkgdir/usr/bin/chatbox
    install -Dm755 chatbox -t $pkgdir/usr/bin/
}
