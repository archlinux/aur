 
# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=bash-command-timer-git
provides=(bash-command-timer)
pkgver=r39.f1b5412
pkgrel=3
pkgdesc="Pretty-print execution time for each bash command."
arch=('any')
url="https://github.com/jichu4n/bash-command-timer"
license=('APACHE')
makedepends=('git')
depends=('bash-preexec')

source=("${pkgname}-${pkgver}::git+https://github.com/jichu4n/bash-command-timer.git#branch=master")
install="${pkgname}.install"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  # Cf. https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m0755 "$srcdir/$pkgname-$pkgver/bash_command_timer.sh" \
    "$pkgdir/usr/share/bash-command-timer/bash_command_timer.sh"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
