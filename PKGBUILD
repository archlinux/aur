# Maintainer: Hexa-Programmer
pkgname=hexatyping-git
_pkgname=hexatyping
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimalist, terminal-based typing tester (TUI) with specialized programming and symbol modes."
arch=('any')
url="https://github.com/Hexa-Programmer/hexatyping" # Make sure this is your actual GitHub URL!
license=('MIT')
depends=('python')
makedepends=('git')
provides=('hexatyping')
conflicts=('hexatyping')

source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/$_pkgname"

    # 1. Install the Python script
    install -Dm755 hexatyping.py "$pkgdir/usr/share/hexatyping/hexatyping.py"
    
    # 2. Copy the entire content folder (handles all your .txt files)
    cp -r content "$pkgdir/usr/share/hexatyping/"
    
    # 3. Create the binary link so 'hexatyping' works in terminal
    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/share/hexatyping/hexatyping.py "$pkgdir/usr/bin/hexatyping"
    
    # 4. Install LICENSE if it exists
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
