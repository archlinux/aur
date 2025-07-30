# Maintainer: BravestCheetah <contact.cheetah@tutamail.com>
pkgname=dirlink
pkgver=1.0.1
pkgrel=3
pkgdesc="A Tiny CLI Tool For Faster Command Line File System Navigation"
arch=('any')
url="https://github.com/BravestCheetah/DirLink"
license=('MIT')
depends=('python' 'python-pyperclip')
makedepends=('python' 'python-pip')
source=("https://github.com/BravestCheetah/DirLink/releases/download/${pkgver}/${pkgver}.tar.gz")
sha256sums=('08fdaba98e941ed6a5d5524063e8bcd8e05e825a53387deacc12a66d048cf981')


prepare() {
  cd "$srcdir"
  tar xf "${pkgver}.tar.gz"
}


package() {
  install -dm755 "$pkgdir/usr/lib/python3.13/site-packages/dirlink"
  cp -r "$srcdir/dirlink-${pkgver}/src/dirlink/"* "$pkgdir/usr/lib/python3.13/site-packages/dirlink/"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/dirlink" << EOF
#!/bin/bash
exec python3 -m dirlink.cli "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/dirlink"
}
