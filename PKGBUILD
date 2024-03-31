# Maintainer : nikp123 <pavlica.nikola@gmail.com>
# Contributor : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=kalker-git
_pkgname=kalker
pkgver=v2.1.1.r7.g74d787f
pkgrel=1
pkgdesc="A calculator program that supports user-defined variables, functions, derivation, and integration."
url="https://github.com/PaddiM8/kalker"
depends=('gcc-libs' 'mpfr' 'gmp' 'libmpc' 'glibc')
makedepends=('cargo' 'git')
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
source=(
  'git+https://github.com/PaddiM8/kalker'
  "build.patch"
)
conflicts=('kalker')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	patch -p1 <../build.patch
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=(
  'SKIP'
  '21b518490cd68c2d6f1bd46326ed734ccab767537f91a66635c89125db5d191c6444a74e80c98fc77c5c47747b436f9e6f8c2bb485fb461fc132a030a4266d6c'
  )
