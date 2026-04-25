# Maintainer: mefkuz <mefkuz@example.com>

pkgname=senfoniscan-git
pkgver=2.0
pkgrel=1
pkgdesc="AI-Powered Passive Reconnaissance CLI (DNS, Subdomain, Screenshots, Wayback, Shodan, HIBP, AI Report)"
arch=('any')
url="https://github.com/mefkuz/SenfoniScan"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('git')
provides=("senfoniscan")
conflicts=("senfoniscan")
source=(
  "git+https://github.com/mefkuz/SenfoniScan.git"
  "senfoniscan.sh"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/SenfoniScan"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Install source files to /usr/share/senfoniscan
  install -dm755 "$pkgdir/usr/share/senfoniscan"
  cp -a "$srcdir/SenfoniScan/"* "$pkgdir/usr/share/senfoniscan/"
  
  # Remove the .git directory if present
  rm -rf "$pkgdir/usr/share/senfoniscan/.git"

  # Install the wrapper script to /usr/bin/senfoniscan
  install -Dm755 "$srcdir/senfoniscan.sh" "$pkgdir/usr/bin/senfoniscan"
}
