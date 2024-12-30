# AUR PACKAGE CREATED BY YGNT7777 It is not my app
# Creator of the app dspinellis
pkgname=ai-cli-lib
pkgver=1.2
pkgrel=1
pkgdesc="ai-cli-lib: AI help for CLI programs"
arch=('x86_64')
url="https://github.com/dspinellis/ai-cli-lib"
license=('Zlib')
depends=('curl' 'jansson' 'readline')
makedepends=('base-devel' 'git')
install=ai-cli-lib.install

# Cloning the repository
source=("git+https://github.com/dspinellis/ai-cli-lib.git#branch=main")
sha256sums=('SKIP')

# Static version
pkgver() {
    echo "1.2"
}

# Building the package
build() {
    cd "$srcdir/$pkgname/src"   # Make sure we go into the correct directory where the Makefile is
    make
}

# Packaging the files
package() {
    cd "$srcdir/$pkgname"

    # Install the README and LICENSE files into the appropriate directories
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE-cutest.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-cutest.txt"
    install -Dm644 LICENSE-inih.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-inih.txt"
    install -Dm644 src/ai_cli.5 "$pkgdir/usr/share/man/man5/ai_cli.5"
    install -Dm644 src/ai_cli.7 "$pkgdir/usr/share/man/man7/ai_cli.7"

    # Create the necessary directories before installing
    mkdir -p "$pkgdir/usr/share/$pkgname"

    # Install all files from the src directory to the appropriate directory
    find src/ -type f ! -name 'Makefile' -exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/" \;

    # Install executable files into /usr/bin
    install -Dm755 src/ai-cli-config "$pkgdir/usr/bin/ai-cli-config"
    install -Dm755 src/ai-cli-activate-bash.sh "$pkgdir/usr/bin/ai-cli-activate-bash.sh"

}
