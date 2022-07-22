# Maintainer: Librewish <librewish@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Paul Kasemir <paul.kasemir@gmail.com>
pkgname=find-the-command-git
pkgver=1.4.3.r0.g5a59306
pkgrel=2
pkgdesc="Advanced command-not-found hook for bash, fish and zsh using the power of pacman"
arch=('any')
url="https://github.com/pkasemir/find-the-command"
license=('WTFPL')
depends=('pacman' 'systemd' 'pkgfile' 'fzf')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/pkasemir/find-the-command.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 usr/lib/systemd/system/pacman-files{.service,.timer} -t \
    "$pkgdir/usr/lib/systemd/system"
  install -Dm644 README.md usr/share/doc/"${pkgname%-git}"/ftc.* -t \
    "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
