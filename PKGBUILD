# Maintainer: Yougraj <your_email@example.com>
pkgname=archtex-git
pkgver=r1.2f7fc73  # This will auto-update itself
pkgrel=1
pkgdesc="A frictionless LaTeX Live Editor"
arch=('any')
url="https://github.com/Yougraj/archtex"
license=('MIT') # Make sure you add a LICENSE file to your GitHub repo!
depends=(
    'python'
    'python-pyqt6'
    'python-pymupdf'
    'texlive-basic'
    'texlive-latex'
    'texlive-latexextra'
    'texlive-fontsrecommended'
)
makedepends=('git')
provides=('archtex')
conflicts=('archtex')
source=("git+https://github.com/Yougraj/archtex.git")
sha256sums=('SKIP')

# This function automatically generates the version number based on your latest GitHub commit
pkgver() {
    cd "$srcdir/archtex"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# This function tells Arch Linux how to install your app into the system
package() {
    cd "$srcdir/archtex"
    
    # 1. Create a read-only directory for your app in the system
    install -d "$pkgdir/usr/share/archtex"
    
    # 2. Copy your Python files into that directory
    cp -r * "$pkgdir/usr/share/archtex/"
    
    # 3. Create a terminal command 'archtex' in /usr/bin/ so users can launch it easily
    install -d "$pkgdir/usr/bin"
    cat <<EOF > "$pkgdir/usr/bin/archtex"
#!/bin/bash
exec python /usr/share/archtex/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/archtex"
}
