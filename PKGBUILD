pkgname=decpkg
pkgver=0.1.0
pkgrel=1
pkgdesc="Declarative package installer for Arch Linux"
arch=('any')
url="https://github.com/maarutan/decpkg"
license=('MIT')
depends=()
makedepends=('python' 'pyinstaller')  
options=('!strip')
source=("decpkg.py")
sha256sums=('SKIP')  

build() {
    if command -v pyinstaller >/dev/null 2>&1; then
        pyinstaller --onefile decpkg.py
    else
        echo "PyInstaller not found — using decpkg.py as a fallback."
        if ! command -v python >/dev/null 2>&1; then
            echo "Python is not installed, cannot build fallback."
            exit 1
        fi
        cp decpkg.py decpkg
        chmod +x decpkg
        mkdir -p dist
        mv decpkg dist/
    fi
}

package() {
    install -Dm755 "dist/decpkg" "$pkgdir/usr/bin/decpkg"
}

