# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.9.0
pkgrel=1
pkgdesc="A statically-typed object-oriented language for writing concurrent programs"
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=('ruby>=2.3.0' 'libffi>=3.2.0')
makedepends=(coreutils 'rust>=1.34' make)
provides=(inko)
conflicts=(inko-git)
options=(strip !docs !libtool !staticlibs)
source=("https://releases.inko-lang.org/${pkgver}.tar.gz")
sha256sums=('311f6e675e6f7ca488a71022b62edbbc16946f907d7e1695f3f96747ece2051f')

build() {
    # Enable the libffi-system feature so the system libffy is used, instead of
    # compiling it from source.
    make build FEATURES='libinko/libffi-system' PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
