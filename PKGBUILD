# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.8.1
pkgrel=1
pkgdesc="A statically-typed object-oriented language for writing concurrent programs"
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=('ruby>=2.3.0' 'libffi>=3.2.0')
makedepends=(coreutils clang 'rust>=1.34' make)
provides=(inko)
conflicts=(inko-git)
options=(strip !docs !libtool !staticlibs)
source=("https://releases.inko-lang.org/${pkgver}.tar.gz")
sha256sums=('02201fd6203d45e0920c849b91aae0adc459d654a27fb3405d181da275365ef5')

build() {
    # Enable the libffi-system feature so the system libffy is used, instead of
    # compiling it from source.
    make build FEATURES='libinko/libffi-system' PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
