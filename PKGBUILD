# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=sortdir
pkgver=0.6
pkgrel=3
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
  '3097f4a246db8e47a8db18f02558a1f2cd0bd1f656217538f4406050fa223aff'
)
sha512sums=(
  'b20db137a559fef9962a842b84fd177206af2d3f64399c1fe11f34add00b5350d2f3e33a453d87c49860259d0a9b99853ced06f84848c538a3b9321bd0f6b210'
  'dad6f25be2272fb0ac73902febf00e4b0827f38f3b6875692f6f85555dcd46a5117fcfc410410484efc69a9af49180c10c9f0e2ba9151c295a95eebf70101b44'
)
b2sums=(
  '2ecb715e454d796bfd1ae6888f294a51ed2af13970cb5f204de76e35065568ed4ab31b694b9f1f7a64b119c0aeca113d8ad9c3f1cf03e32524b4de770e65686f'
  '3e57c18e0588f87626f92be8cddbdcda03d8249b326d7067323f3e2f1426632114730d78a3ea4e1e4de9491a79892eb29ca8e07f271c39dbb4c959ab96005a08'
)

# eof
