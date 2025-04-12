# PKGBUILD

# Maintainer: Your Name <your.email@example.com>
pkgname=pathetic
pkgver=0.1
pkgrel=1
pkgdesc="A lightweight meme-powered programming language."
arch=('x86_64')
url="https://github.com/aditya-ig10/pathetic-lang"
license=('MIT')
depends=('python' 'python-setuptools')
makedepends=('git')
source=("git+https://github.com/aditya-ig10/pathetic-lang.git#branch=main")
sha256sums=('SKIP')  # Using git source, so we skip checksum validation

package() {
    cd "$srcdir/pathetic-lang"

    # Install Python package using setuptools
    python setup.py install --root="$pkgdir"

    # Create a wrapper for the pathetic script (if it's a .py file)
    cat > "$pkgdir/usr/bin/pathetic" <<EOF
#!/usr/bin/env python3
from pathetic.cli import main

if __name__ == "__main__":
    main()
EOF

    # Make the pathetic script executable
    chmod +x "$pkgdir/usr/bin/pathetic"
}
