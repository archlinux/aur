# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=sortdir
pkgver=0.6
pkgrel=2
pkgdesc='Have [almost] any application sort its directory listings'
arch=('x86_64' 'armv7h' 'aarch64')
url='http://ftp.uhulinux.hu/sources/sortdir'
license=('GPL2')
provides=('sortdir')
conflicts=('sortdir')
source=(
  "$url/$pkgname-$pkgver.tar.gz"
  "$pkgname.sh"
)
_libname="lib$pkgname"
_soname="$_libname.so"

build() {
  cd "$pkgname-$pkgver" || exit 1

  export CFLAGS="$CFLAGS $LTOFLAGS -shared -ldl -fPIC"

  gcc $CFLAGS -o "$_soname" "${_libname}.c"
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 "$_soname"                 "$pkgdir/usr/lib/$_soname.$pkgver"
  ln -srf "$pkgdir/usr/lib/$_soname.$pkgver" "$pkgdir/usr/lib/$_soname"

  for readme in README_{EN,HU}; do
    install -Dm0644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
  done

  install -Dm0755 "$startdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

post_install() {
  ldconfig
}

post_upgrade() {
  post_install "$@"
}

sha256sums=(
  '62acb494d995e868d721d01e2d00e525f2ead23670ba23272d529a7606eebd2e'
  '876bf68aead28140a4484f286f09f9f3e8ecbaaf48caebbcfb1d489195b23212'
)
sha512sums=(
  'b20db137a559fef9962a842b84fd177206af2d3f64399c1fe11f34add00b5350d2f3e33a453d87c49860259d0a9b99853ced06f84848c538a3b9321bd0f6b210'
  '21f80b42093ff6687d5a8295227cf393144323fdc983ed7c98ade2465c70f8a234661fd41821f03833fe50259cca5e4e05092af428acac8695de5ea162d50178'
)
b2sums=(
  '2ecb715e454d796bfd1ae6888f294a51ed2af13970cb5f204de76e35065568ed4ab31b694b9f1f7a64b119c0aeca113d8ad9c3f1cf03e32524b4de770e65686f'
  'eabcfb6267c6a6eb9047b945e47c7c715a8677a4402bee744ba8ec9d235f85fe49baf5ffa0e6219ac69b48c5a7a02c9ce0e2291d0d403de29bcb5b1437470a64'
)

# eof
