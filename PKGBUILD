# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Rami Chowdhury <rami.chowdhury@gmail.com>
# Maintainer: cvnb
pkgname=gerbil-scheme
_pkgname=gerbil
pkgver=0.18.1
pkgrel=1
pkgdesc="Opinionated dialect of Scheme designed for systems programming, on the Gambit runtime."
arch=(x86_64 i686)
url="https://github.com/mighty-gerbils/gerbil"
license=('LGPLv2.1' 'Apache 2.0')
depends=('openssl' 'zlib' 'sqlite')
conflicts=('gerbil-scheme-git')
source=("git+$url#tag=v$pkgver")
sha512sums=('SKIP')

build() {
    cd "$_pkgname"

    echo "Configuring..."
    ./configure --prefix="/opt/gerbil"

    echo "Building..."
    make
}

package() {
    echo "Packaging..."

    cd "$_pkgname"
    make DESTDIR=${pkgdir} install

    mkdir -p ${pkgdir}/etc/profile.d/
    cat <<'EOF' > ${pkgdir}/etc/profile.d/gerbil-scheme.sh
export PATH=/opt/gerbil/bin:$PATH
EOF
}
