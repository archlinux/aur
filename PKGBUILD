# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.10.0
pkgrel=1
pkgdesc="A statically-typed object-oriented language for writing concurrent programs"
pkgdesc="A language for building concurrent software with confidence"
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=('libffi>=3.2.0')
makedepends=('rust>=1.62' make)
provides=(inko)
conflicts=(inko-git)
options=(strip !docs !libtool !staticlibs)
source=("https://releases.inko-lang.org/${pkgver}.tar.gz")
sha256sums=('d38e13532a71290386164246ac8cf7efb884131716dba6553b66a170dd3a2796')

build() {
    # Enable the libffi-system feature so the system libffi is used, instead of
    # compiling it from source.
    make build FEATURES='libffi-system' PREFIX='/usr'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
