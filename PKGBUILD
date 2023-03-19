# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=profile-sync-daemon-git
_pkgname=${pkgname/-git/}
_branch=fuse-overlayfs
pkgver=r738.6c925e4
pkgrel=1
pkgdesc="Symlinks and syncs browser profile dirs to RAM"
arch=('any')
url="https://github.com/graysky2/profile-sync-daemon"
license=('MIT')
depends=('bash' 'findutils' 'procps-ng' 'rsync' 'systemd')
optdepends=('zsh-completions: for completion when using zsh'
            'fuse-overlayfs: for overlayfs mode')
install="psd.install"
conflicts=(profile-sync-daemon)
source=("git+https://github.com/graysky2/profile-sync-daemon.git#branch=$_branch")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 MIT "${pkgdir}/usr/share/licenses/${pkgname/-git/}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname/-git/}"
}
