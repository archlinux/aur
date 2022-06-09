# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pyston-bin
pkgver=2.3.4
pkgrel=1
pkgdesc="A fork of CPython with additional optimizations for performance"
arch=('aarch64' 'x86_64')
url="https://blog.pyston.org/"
license=('custom')
depends=('glibc')
provides=("pyston=$pkgver")
conflicts=('pyston')
options=('!strip')
source=("LICENSE::https://raw.githubusercontent.com/pyston/pyston/pyston_master/LICENSE")
source_aarch64=("https://github.com/pyston/pyston/releases/download/pyston_${pkgver}/pyston_${pkgver}_portable_arm64.tar.gz")
source_x86_64=("https://github.com/pyston/pyston/releases/download/pyston_${pkgver}/pyston_${pkgver}_portable_amd64.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('0733d120562c73f129af5633f8ea7faad3fdcab931f2234c02cd81f21eada2cd')
sha256sums_x86_64=('f8274bdead746f839791d785a5edad8a0b8723016b38751321c8eaf16ebd22db')


package() {
  cd "pyston_$pkgver"

  rm {pyston,pyston3}

  mkdir -p "$pkgdir/opt/pyston"
  mv * "$pkgdir/opt/pyston"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/pyston/bin"/{pyston,pyston3} "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/pyston"
}
