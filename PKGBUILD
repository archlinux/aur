# Maintainer: Aaha3 <Aaha3.sh@gmail.com>

pkgname='laddu-git'
pkgver='1.4.6'
pkgrel=1
pkgdesc="Laddu is a small, simple AUR Helper Built in Python"
arch=('x86_64')
url="https://github.com/JJDHI-3/Laddu.git"
license=('GPL')
depends=('git' 'python-colorama' 'python-requests')
makedepends=('python-build' 'python-wheel')
source=('laddu::git+https://github.com/JJDHI-3/Laddu.git')
sha256sums=('SKIP')

# Optional pkgver function if required
# pkgver() {
#          cd "$srcdir/$pkgname-$pkgver"
#          git describe --long --abrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    cd "$srcdir/laddu/src/laddu-1.4.6/"
    python3 -m pip install --upgrade build
    python3 -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/laddu/src/laddu-1.4.6/"
    python3 -m pip install --root="$pkgdir" dist/*.whl

    # Create the wrapper script
    mkdir -p "$pkgdir/usr/bin"
    echo "#!/bin/sh" > "$pkgdir/usr/bin/laddu"
    echo "python3 /usr/share/$pkgname/laddu.py \"\$@\"" >> "$pkgdir/usr/bin/laddu"
    chmod +x "$pkgdir/usr/bin/laddu"
    
    # Copy the laddu script to a shared directory
    install -Dm755 laddu.py "$pkgdir/usr/share/$pkgname/laddu.py"
}
