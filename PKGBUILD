# Maintainer: UnkwUsr <ktoto2707043@gmail.com>
pkgname='rclip-git'
pkgver=r58.28a59f4
pkgrel=1
pkgdesc="Clipboard manager written in rust with ability to save different entry types (text, images, etc.)"
arch=('i686' 'x86_64')
url="https://github.com/UnkwUsr/rclip"
license=('MIT')
provides=("rclip")
makedepends=('cargo' 'git')
conflicts=('rclip')
source=("$pkgname::git+https://github.com/UnkwUsr/rclip")
sha1sums=('SKIP')

build() {
  cd $pkgname
  cargo build --release
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # grep version Cargo.toml | cut -zd '"' -f2 | head -c -1
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/rclipd" "$pkgdir/usr/bin/rclip"

  install -Dm755 "scripts/copy.sh" "$pkgdir/usr/bin/rclip_copy"
  install -Dm755 "scripts/rm.sh" "$pkgdir/usr/bin/rclip_rm"

  install -Dm755 "scripts/feh_pick_image.sh" "$pkgdir/usr/share/rclip/feh_pick_image.sh"
  install -Dm755 "scripts/fzf_pick.sh" "$pkgdir/usr/share/rclip/fzf_pick.sh"
  install -Dm755 "scripts/_pick.sh" "$pkgdir/usr/share/rclip/_pick.sh"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/rclip/README.md"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/rclip/LICENSE"
}

