# Maintainer: Kris Nóva <kris@nivenly.com>
pkgname="falco"
pkgver="0.29.1"
pkgrel=1
pkgdesc="Falco Runtime Security"
arch=("x86_64")
url="https://falcosecurity.org"
license=("Apache2")
groups=()
depends=("linux-headers")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

# EXAMPLE URL: https://download.falco.org/packages/bin/x86_64/falco-0.29.1-x86_64.tar.gz
source=("https://download.falco.org/packages/bin/$arch/$pkgname-$pkgver-$arch.tar.gz")

# Falco 0.29.1 SHA256
# Note: This can be found by running "makepkg -g" in this directory.
#       The AUR documentation suggests "makepkg -g >> PKGBUILD"
sha256sums=('60a7189f7d1c583b45966ea50af98ef3c3126aab52437ed1f67ef3d351034b90')

# Kris Nóva PGP Key
validpgpkeys=('F5F9B56417B7F2CAC1DEC2E372BB115B4DDD8252')

prepare() {
    echo "Preparing Falco Build..."
    echo "Falco Version: $pkgver"
}

build() {
    echo "Compiling Kernel Module..."
    cd $pkgname-$pkgver-$arch/usr/src/falco*
    make
}

check() {
    echo "check()"
}

package() {
    echo "Installing Default Configuration..."
    sudo mkdir -p /etc/falco
    sudo cp -rv $pkgname-$pkgver-$arch/etc/falco/* /etc/falco
    sudo mkdir -p /usr/share/falco
    sudo cp -rv $pkgname-$pkgver-$arch/usr/share/falco/* /usr/share/falco

    echo "Intalling Binary [$arch]..."
    # AUR Informs us that packages should NEVER be installed to /usr/local
    sudo cp -rv $pkgname-$pkgver-$arch/usr/bin/* /usr/bin

    echo "Installing Kernel Module..."
    cd $pkgname-$pkgver-$arch/usr/src/falco*
    sudo make install
}
