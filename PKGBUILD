# Maintainer: Daniel Souza <aur at posix dot dev dot br>

_gitbranch=main
_gitauthor=danisztls
pkgname=arbie-git
pkgver=v1.1.1.r0.g5a2d9d2
pkgrel=3
pkgdesc="Automatic Robust Backup, an archiving and synchronization tool."
arch=('any')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("git+https://github.com/${_gitauthor}/${pkgname%-git}.git#branch=${_gitbranch}")
install=arbie.install
sha512sums=('SKIP')
depends=('bash' 'borg' 'gocryptfs' 'rclone' 'rsync' 'systemd' 'git')
optdepends=('pass: standard password manager' 'gopass: improved password manager')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # Use last tag
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
