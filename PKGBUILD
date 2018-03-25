# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bash-completion-git
pkgver=2.8.r20.gd664aebf
pkgrel=1
pkgdesc="Programmable completion functions for bash"
arch=('any')
url="https://github.com/scop/bash-completion"
license=('GPL2')
depends=('bash')
makedepends=('git')
provides=('bash-completion')
conflicts=('bash-completion')
options=(!emptydirs)
source=("git+https://github.com/scop/bash-completion.git")
sha256sums=('SKIP')


pkgver() {
  cd "bash-completion"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bash-completion"

  autoreconf -fi
  ./configure --prefix="/usr" --sysconfdir="/etc"
  make
}

check() {
  cd "bash-completion"

  make check
}

package() {
  cd "bash-completion"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/etc/profile.d/bash_completion.sh"
  rm "$pkgdir/usr/share/bash-completion/completions/makepkg"
}
