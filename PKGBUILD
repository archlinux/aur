# Maintainer: Asakura Mizu <asakuramizu111@gmail.com>
pkgname=defoldsdk-headers
pkgver=1.9.4.redfdbe3
pkgrel=1
epoch=
pkgdesc='Headers for Defold SDK'
arch=('x86_64')
url='https://defold.com/'
license=('custom')
groups=()
depends=()
makedepends=('curl' 'jq')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=defoldsdk-headers.install
changelog=
validpgpkeys=()
source=('LICENSE')
sha256sums=('be6e9921ba01445d200ba3dc09b5cab149a58d57a76ca98376b52af87d817a7a')

prepare() {
    cd "$srcdir"

    curl -O https://d.defold.com/stable/info.json
    _sha1=$(cat info.json | jq -r '.sha1')
    curl -O "https://d.defold.com/archive/stable/${_sha1}/engine/defoldsdk_headers.zip"

    bsdtar -xf defoldsdk_headers.zip
}

pkgver() {
    cd "$srcdir"

    _version=$(cat info.json | jq -r '.version')
    _sha1=$(cat info.json | jq -r '.sha1')
    echo "${_version}.r${_sha1:0:7}"
}

package() {
    cd "$srcdir"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p "$pkgdir/usr/include"

    cp -r defoldsdk/include "$pkgdir/usr/include/defoldsdk"
    cp -r defoldsdk/sdk/include/dmsdk "$pkgdir/usr/include/defoldsdk"
}
