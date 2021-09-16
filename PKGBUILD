pkgname=gnome-shell-extension-media-controls-git
pkgver=17.b26532f
pkgrel=1
pkgdesc="A media indicator for the GNOME shell."
arch=('any')
url="https://github.com/cliffniff/media-controls"
license=('MIT')
makedepends=('git' 'zip' 'unzip')
depends=('gnome-shell')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${pkgname}::"git+${url}")
sha256sums=('SKIP')

build(){
    cd "$srcdir/$pkgname"
    sh "build.sh" -p
}

package() {
	VERSION_DIR=$(ls -Art "$srcdir/$pkgname/builds" | tail -n 1)
	ZIP_FILE="$srcdir/$pkgname/builds/$VERSION_DIR/extension.zip"
	destdir="$pkgdir/usr/share/gnome-shell/extensions/mediacontrols@cliffniff.github.com/"
    mkdir -p "$destdir"
    install -dm755 "$destdir"
    cp -r "$ZIP_FILE" "$destdir/."
    cd "$destdir"
    unzip extension.zip
    rm -rf extension.zip
}