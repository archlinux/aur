# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=3.0.0
pkgrel=1
pkgdesc="A CLI utility to list installed packages with filtering and sorting, written in Go."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Zweih/yaylog"
license=("MIT")
provides=('yaylog')
conflicts=('yaylog-git')

release_url="${url}/releases/download/v${pkgver}/yaylog"
ext=".tar.gz"

source_x86_64+=("${release_url}-x86_64${ext}")
source_aarch64+=("${release_url}-aarch64${ext}")
source_armv7h+=("${release_url}-armv7h${ext}")

sha256sums_x86_64=('295659d01ec6fb1637e4133dc680d3bf6b4a496147dce67f3abb058383e7da68')
sha256sums_aarch64=('78b5656229e2b2b8a770c7df8ade5214a6ff2cd856124a574bab6d8561483d73')
sha256sums_armv7h=('b6e91f3244e1857a55407840c766fad08f02f9e7a49a6ab29c46ef1ac13d33b9')

package() {
  tar -xzf "$srcdir/yaylog-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "$srcdir/yaylog-${CARCH}" "$pkgdir/usr/bin/yaylog"
  install -Dm644 "$srcdir/yaylog.1" "$pkgdir/usr/share/man/man1/yaylog.1"
}

post_upgrade() {
  previous_version=$1
  new_version=$2

  if [[ $(vercmp "$previous_version" "3.0.0") -lt 0 ]]; then
    echo "==> yaylog has been upgraded to a precompiled binary as of version 3.0.0."
    echo "==> If you prefer to build from source, please install the yaylog-git package."
  fi
}
