# Maintainer: Dylan Turner dylantdmt@gmail.com
pkgname=bgrm-git
pkgver=21.1023
pkgrel=1350
epoch=
pkgdesc="A utility for removing backgrounds from a webcam and returning a virtual webcam for use in applications like Teams, OBS, etc"
arch=('any')
url="https://www.github.com/blueOkiris/bgrm"
license=('GPL3')
makedepends=('git' 'python' 'python-pip' 'v4l2loopback-dkms')
source=('git://github.com/blueOkiris/bgrm.git')
md5sums=('SKIP')

build() {
    cd bgrm

    echo "Setting up proper virtual environment."
    ./scripts/setup-venv.sh

    echo "Patching "
    ./scripts/patch-v4l2-py-mod.sh
}

package() {
    echo "Installing to $pkgdir/opt/bgrm."

    mkdir -p "$pkgdir/opt/bgrm"

    cp bgrm/bgrm.sh "$pkgdir/opt/bgrm"
    cp bgrm/LICENSE "$pkgdir/opt/bgrm"
    cp bgrm/README.md "$pkgdir/opt/bgrm"
    cp -r bgrm/bgrm/ "$pkgdir/opt/bgrm"
    cp -r bgrm/.venv "$pkgdir/opt/bgrm"

    mkdir -p "$pkgdir/usr/bin"

    echo "Creating link in $pkgdir/usr/bin"
    cat <<EOF > "$pkgdir/usr/bin/bgrm"
#!/bin/bash
cd /opt/bgrm
source bgrm.sh
EOF
    chmod +x "$pkgdir/usr/bin/bgrm"
}