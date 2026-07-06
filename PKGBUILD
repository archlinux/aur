# Maintainer: Vincent Schult <viboschu@gmail.com>

pkgname=voe-dl-git
pkgver=1.8.2.r0.gd81256f
pkgrel=1
pkgdesc="A Python-based downloader for videos hosted on voe.sx."
arch=('any')
url="https://github.com/MPZ-00/voe-dl"
license=(GPL-3.0-or-later)

depends=(
  python
  bash
  python-requests
  python-beautifulsoup4
  yt-dlp
  python-wget
)

makedepends=(
  git	
)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+https://github.com/MPZ-00/voe-dl.git")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package(){
  cd "$srcdir/${pkgname%-git}"

  install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
  install -dm755 "$pkgdir/usr/bin"

  install -Dm644 dl.py "$pkgdir/usr/share/${pkgname%-git}/dl.py"

  cat > "$pkgdir/usr/bin/${pkgname%-git}" << EOF
#!/bin/bash
exec python /usr/share/${pkgname%-git}/dl.py "\$@"
EOF

  chmod 755 "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
