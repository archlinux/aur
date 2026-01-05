# Maintainer: Piotrek2713 <piotrek.karasinski13@gmail.com>
# Contributor: Kilo Code <ai@kilo.dev>

pkgname=ca-racing
pkgver=0.2.3_alpha
pkgrel=1
pkgdesc="Top-down 2D racing game written in Python"
arch=('any')
url="https://github.com/piotrek1372/ca-racing"
license=('MIT')

depends=('python-pygame' 'python-numpy' 'python-pillow')
makedepends=('python-pip' 'python-setuptools')

# Source code from GitHub release
_urlver="${pkgver/_/-}"
source=("$pkgname-$_urlver.tar.gz::https://github.com/piotrek1372/$pkgname/archive/refs/tags/v$_urlver.tar.gz"
        "ca-racing.desktop"
        "ca-racing.sh")
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    cd "$srcdir/CA-Racing-$_urlver"
    # No build steps needed for a Python source package
    echo "Skipping build process..."
}

package() {
    # Install the application source code
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/CA-Racing-$_urlver/"* "$pkgdir/opt/$pkgname/"

    # Install Python dependencies
    pip install -r "$pkgdir/opt/$pkgname/requirements.txt" --target "$pkgdir/opt/$pkgname/vendor" --no-user

    # Install the wrapper script
    install -Dm755 "$srcdir/ca-racing.sh" "$pkgdir/usr/bin/$pkgname"

    # Install icon and desktop file
    install -Dm644 "$srcdir/CA-Racing-$_urlver/assets/images/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/ca-racing.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
