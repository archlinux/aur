# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pyston-bin
pkgver=2.3.3
pkgrel=2
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
sha256sums_aarch64=('f93f55b59120f576e5755bd8f86fa38361a30ca5389dbadc68450051ee2dccb1')
sha256sums_x86_64=('7a38e2bd2fed38e6daba4d513bae32af0d5ba6185cadf37cb1af6bcc4de0cb57')


package() {
  cd "pyston_$pkgver"

  rm {pyston,pyston3}

  mkdir -p "$pkgdir/opt/pyston"
  mv * "$pkgdir/opt/pyston"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/pyston/bin"/{pyston,pyston3} "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/pyston"
}
