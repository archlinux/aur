# Maintainer: Keiran <keiran0@proton.me>
pkgname=e-zshot
pkgver=1.2.3
pkgrel=1
pkgdesc="CLI to automate taking screenshots and uploading them to e-z.host."
arch=('any')
url="https://github.com/RobinTT69/e-z-screenshot-linux/"
license=('custom')
depends=('python-pillow' 'python-requests')
source=("https://github.com/RobinTT69/e-z-screenshot-linux/releases/download/v${pkgver}/e-zshot-${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  tar xzf e-zshot-${pkgver}.tar.gz
}

package() {
  # Check the actual directory name after extraction
  local extracted_dir
  extracted_dir=$(tar -tf e-zshot-${pkgver}.tar.gz | head -n 1 | cut -f1 -d"/")

  cd "$srcdir/$extracted_dir" || exit 1

  install -Dm755 plugins/e-z-flameshot.py "$pkgdir/usr/bin/e-z-flameshot"
  install -Dm755 plugins/e-z-grim.py "$pkgdir/usr/bin/e-z-grim"

  install -Dm755 e-zshot.py "$pkgdir/usr/bin/e-zshot"

  install -Dm755 e-zconfig.sh "$pkgdir/usr/bin/e-zconfig"

  mkdir -p "$pkgdir/usr/share/doc/e-zshot"
  if [[ -f README.md ]]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/e-zshot/README.md"
  fi
}
