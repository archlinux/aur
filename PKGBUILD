# Maintainer: Daniel Souza <danisztls@gmail.com>

_gitbranch=main
_gitauthor=danisztls
pkgname=arbie-git
pkgver=v1.0.1.r0.g6f49e02
pkgrel=5
pkgdesc="Automatic Robust Backup, an archiving and synchronization tool."
arch=('any')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("git://github.com/${_gitauthor}/${pkgname%-git}#branch=${_gitbranch}")
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
