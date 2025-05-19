# Maintainer: defc0n <nehartale8@gmail.com>
pkgname=hitech-arch-animation
_commit=HEAD
pkgver=2
pkgrel=1
pkgdesc="Hi-Tech Arch Linux Plymouth Theme with 148 frames animation"
arch=('any')
url="https://github.com/xDeFc0nx/HiTech-arch-animation"
license=('MIT')
depends=('plymouth')
makedepends=('git')

source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/HiTech-arch-animation"
  git describe --long --tags 2>/dev/null || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local repo_dir_name="HiTech-arch-animation"
  cd "$srcdir/$repo_dir_name"

  install -dm755 "$pkgdir/usr/share/plymouth/themes/$pkgname"

  install -m644 "./animated-boot.script" "$pkgdir/usr/share/plymouth/themes/$pkgname/"
  install -m644 "./$pkgname.plymouth" "$pkgdir/usr/share/plymouth/themes/$pkgname/"

  for img in ./progress-*.png; do
    if [ -f "$img" ]; then
        install -m644 "$img" "$pkgdir/usr/share/plymouth/themes/$pkgname/"
    fi
  done

  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

