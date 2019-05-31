# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=uxy-git
pkgver=r152.d3e9ba5
pkgrel=1
pkgdesc="UXY is tool to manipulate UXY format"
url="https://github.com/sustrik/uxy"
arch=('any')
license=('MIT')
depends=('python-pyaml')
makedepends=('git')
conflicts=('uxy')
provides=('uxy')
source=(
  "uxy-git::git+https://github.com/sustrik/uxy.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"/$pkgname

  for file in tools/*; do
    install -D -m644 -t "${pkgdir}/usr/lib/python3.7/site-packages/tools/" "$file"
  done

  install -D -m755 uxy "${pkgdir}/usr/bin/uxy"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
