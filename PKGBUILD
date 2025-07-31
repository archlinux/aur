# Maintainer: Heyian <heyian404 AT on DOT me>
# Contributor: graysky <therealgraysky AT proton DOT me>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=profile-sync-daemon-git
_pkgname=${pkgname/-git/}
_branch=master
pkgver=6.50.r14.gbdea6f0
pkgrel=1
pkgdesc="Symlinks and syncs browser profile dirs to RAM"
arch=('any')
url="https://github.com/graysky2/profile-sync-daemon"
license=('MIT')
depends=('git' 'bash' 'findutils' 'procps-ng' 'rsync' 'systemd')
optdepends=('zsh-completions: for completion when using zsh'
            'fuse-overlayfs: for overlayfs mode')
install="psd.install"
provides=(profile-sync-daemon)
conflicts=(profile-sync-daemon)
source=("git+https://github.com/graysky2/profile-sync-daemon.git#branch=$_branch")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --exclude='v*[a-zA-Z]*' \
  | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 MIT "${pkgdir}/usr/share/licenses/${pkgname/}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname/}"
}
