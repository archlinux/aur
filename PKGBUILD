pkgname=cat-browser-git
pkgver=1.0.0
pkgrel=1
pkgdesc="cat browser is an internet browser made for people who love cats"
arch=('x86_64')
url="https://github.com/anamelessguy1/cat-browser"
license=('GPL3')

depends=(
    'python'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'python-pypresence'
    'python-psutil'
)

source=("git+https://github.com/anamelessguy1/cat-browser.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/cat-browser"
    git describe --tags --abbrev=0 | sed 's/^v//'
}

package() {
    cd "$srcdir/cat-browser"
    install -d "$pkgdir/usr/lib/cat-browser"

    install -m755 cat_browser.py "$pkgdir/usr/lib/cat-browser/cat_browser.py"
    install -m644 *.png *.txt *.ttf *.mp4 *.wav "$pkgdir/usr/lib/cat-browser/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/cat-browser" <<'EOF'
#!/usr/bin/env bash
exec python /usr/lib/cat-browser/cat_browser.py "$@"
EOF
}
