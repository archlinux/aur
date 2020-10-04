# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko
pkgver=0.8.0
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
source=('inko::git+https://gitlab.com/inko-lang/inko.git')
source=('https://releases.inko-lang.org/0.8.0.tar.gz')
sha256sums=('429d5ace7f6eb463cc53006ea32482f760e79dd34d1f5a51dceb9fcdb0cf7b07')

build() {
    # Enable the libffi-system feature so the system libffy is used, instead of
    # compiling it from source.
    make build FEATURES='libinko/libffi-system'
}

package() {
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
