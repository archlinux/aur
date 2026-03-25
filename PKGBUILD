# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Evan H. Moore <evmoore43@gmail.com>
pkgname=unispec
pkgver=0.0.3
pkgrel=1
pkgdesc="Spec Driven Development that doesn't suck. Build your own development workflows with it's modular system (built in Rust btw) ;)"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/uwzis/unispec"
license=('MIT')
depends=()
makedepends=('cargo' 'make')
optdepends=()
source=("$pkgname-$pkgver::git+https://github.com/uwzis/unispec.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make release
}


package() {
    cd "$srcdir/$pkgname-$pkgver"

    # 1. Standard install (if your Makefile supports DESTDIR)
    make install-system DESTDIR="$pkgdir" PREFIX=/usr

    # 2. Safely move your project files to /usr/share
    # Example: Moving a 'data' folder from your project to /usr/share/unispec
    # We use 'cp -r' then ensure permissions, or 'install' for specific files.
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r ./ "$pkgdir/usr/share/$pkgname/"
    # 3. Install completion scripts (using -Dm644 to create paths)
    # Use find to avoid the wildcard '*' failing if multiple builds exist



}
