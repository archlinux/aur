# Maintainer: Horror Proton <107091537+horror-proton@users.noreply.github.com>

pkgname=sshping-git
pkgver=v0.1.4.r62.558bcce
pkgrel=1
pkgdesc="ssh-based ping: measure character-echo latency and bandwidth for an interactive ssh session"
url="https://github.com/spook/sshping"
arch=('x86_64')
license=('MIT')
depends=('libssh')
makedepends=('perl' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build () {
  cd "$srcdir/${pkgname%-git}"
  make bin/sshping
  make doc/sshping.8
}

package () {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p "${pkgdir}/usr/bin"
  install -D bin/sshping "${pkgdir}/usr/bin"

  install -D doc/sshping.8 -t "${pkgdir}/usr/share/man/man8/"

  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
