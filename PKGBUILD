# Maintainer: defc0n <your_actual_email@example.com>  # Replace with your actual email
pkgname=hitech-arch-animation
_commit=HEAD 

pkgver=2.0
pkgrel=2  
pkgdesc="Hi-Tech Arch Linux Plymouth Theme"
arch=('any')
url="https://github.com/xDeFc0nx/HiTech-arch-animation"
license=('MIT')
depends=('plymouth')

 makedepends=('git')

source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/$(basename "${source[0]/.git/}")"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
 }

package() {
  local repo_dir_name
  repo_dir_name=$(basename "${source[0]/.git/}") 
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
