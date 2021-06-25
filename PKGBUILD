# Maintainer: willemw <willemw12@gmail>
#
# From 'ulipad' package:
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: TDY <tdy@gmx.com>
# Contributor: NicolÃ¡s de la Torre <ndelatorre@gmail.com>

pkgname=ulipad-git
pkgver=r13.4c7d590
pkgrel=1
pkgdesc="A wxPython powered, programmer oriented and flexible editor"
arch=('any')
url="https://github.com/limodou/ulipad"
license=('GPL')
makedepends=('git')
depends=('wxpython')
optdepends=('psyco: speed support' 'python2-pyenchant: spell-checking support')
source=($pkgname::git+$url.git
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.png"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'fc93c83105938972fd8b65b8367b4b8b3dc3e9adc6f4eb330fde8c15fc6c85c0'
            '8385a27168ac073b3117a152b4b3c0035a844c8c46a17bd29abd5c3e70d0f4b2'
            '702e7a6cb483f9531ed626a9828373d7623001bf501ad3adfb491e953bc9f172')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  find $pkgname -name "*.py" -exec sed -i "s|env python|env python2|" '{}' \;
  find $pkgname -name "*.py" -exec sed -i "s|/usr/bin/python|/usr/bin/python2|" '{}' \;
}

package() {
  install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "${pkgname%-git}.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"

  install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
  cp -a $pkgname/* "$pkgdir/usr/share/${pkgname%-git}"
}

