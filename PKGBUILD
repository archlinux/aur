# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pyston-bin
pkgver=2.3.5
pkgrel=3
pkgdesc="A fork of CPython with additional optimizations for performance"
arch=('aarch64' 'x86_64')
url="https://blog.pyston.org/"
license=('LicenseRef-pyston')
depends=('glibc')
provides=("pyston=$pkgver")
conflicts=('pyston')
options=('!strip')
source=("LICENSE::https://raw.githubusercontent.com/pyston/pyston/pyston_master/LICENSE")
source_aarch64=("https://github.com/pyston/pyston/releases/download/pyston_${pkgver}/pyston_${pkgver}_portable_arm64.tar.gz")
source_x86_64=("https://github.com/pyston/pyston/releases/download/pyston_${pkgver}/pyston_${pkgver}_portable_amd64.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('c578cb806c62d9dca8728f190a87e172305bd80887e206df42c4c5658ab469c1')
sha256sums_x86_64=('c71c711d60a9c18f243a9e30fd35e0818674ae96f534c67c27b0cdfbc9132ef8')


package() {
  cd "pyston_$pkgver"

  rm {pyston,pyston3}

  install -dm755 "$pkgdir/opt/pyston"
  mv * "$pkgdir/opt/pyston"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/pyston/bin"/{pyston,pyston3} "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/pyston"
}
