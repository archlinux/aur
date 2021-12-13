# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-metno-locationforecast'
_pkgname="${pkgname#python-}"
pkgver=1.0.0
pkgrel=3
pkgdesc='Python interface for the MET Norway Locationforecast/2.0 weather service'
arch=('any')
license=('MIT')
url='https://github.com/Rory-Sullivan/metno-locationforecast'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  'setup-py.diff'
)
depends=(
  'python'
  'python-requests'
)
makedepends=(
  'python-setuptools'
)
provided=("$pkgname")
conflicts=("$pkgname" "$pkgname-git")
md5sums=(
  'b045c6e8300172d33e23e6bbf8fb4ba6'
  'e4611f1788bdb53fd3a67e0a64d2c3f6'
)
sha1sums=(
  'f5784ba4d7a91ec017207e9edfb8afa69a933979'
  '1e391965db77317f8d132fd73752a5794655efc2'
)
sha256sums=(
  '589fec6a49ed0d20ecd70948f5d6c6d9a2750f43b8c64846e8b60339b7e0d761'
  '7d80f60eec48fe9a660d3cee73dd11807aaef7f7b368b1e36a427133562dc63c'
)
sha512sums=(
  'b74803bfc1bd68c60b717a2fcef38ed568c773fd4f15e17a4dc0f5db58379225dd3e393e22fd2da3dd24349538b45211bb93bf8cb1a996055856c09085da181d'
  '0d8d66d993ef108f289b11abf0d88852ac3d89fca8963927260970245001dc35521eddf7558ea56b194e4e29cbb0423e68b863d7746c3778e9a1f7efc9404058'
)
b2sums=(
  'e76f2400592fd3ad83c2c93eb9896a2681172f2b0f6958f60a69f1d18ea8d28d26e4a95b8e7c226f275ac8c0a029e7fe6f404bc6611c765590d2c1ad245bfb31'
  'af06773e9bd20eb07004e62d16116d53b45feb4db12ea16d2ed13a6715a976b26321d0f19f7ce81bd83c0a2de7518b68679933d9d8b44f38f817a27d3fcbc267'
)

prepare() {
  cd "$_pkgname-$pkgver" || exit 1

  patch -Np1 -i "$srcdir/setup-py.diff"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for mdfile in CHANGELOG.md README.md; do
    install -Dm0644 "$mdfile" "$pkgdir/usr/share/doc/$pkgname/$mdfile"
  done
}

# eof
