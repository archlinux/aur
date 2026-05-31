# Maintainer: Yougraj <yougrajbora.developer@gmail.com>

pkgname=suyoratex-git
pkgver=r1.2f7fc73
pkgrel=1
pkgdesc="A frictionless LaTeX Live Editor"
arch=('any')
license=('MIT')

# 1. Update the URL to your new GitHub repo name
url="https://github.com/Yougraj/SuyoraTex"

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
provides=('suyoratex')
conflicts=('suyoratex' 'archtex' 'archtex-git')

# 2. Update the source link. 
# We put "suyoratex::" at the front to force Linux to make the folder lowercase.
source=("suyoratex::git+https://github.com/Yougraj/SuyoraTex.git")
sha256sums=('SKIP')

pkgver() {
    # 3. Update the folder name here
    cd "$srcdir/suyoratex"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # 4. Update the folder name here
    cd "$srcdir/suyoratex"
    
    install -d "$pkgdir/usr/share/suyoratex"
    cp -r * "$pkgdir/usr/share/suyoratex/"
    
    install -d "$pkgdir/usr/bin"
    cat <<EOF > "$pkgdir/usr/bin/suyoratex"
#!/bin/bash
exec python /usr/share/suyoratex/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/suyoratex"
}
