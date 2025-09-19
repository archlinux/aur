# Maintainer: tarball <bootctl@gmail.com>

pkgname=trufflehog-bin
pkgver=3.90.8
pkgrel=1
pkgdesc='Find, verify, and analyze leaked credentials'
url='https://github.com/trufflesecurity/trufflehog'
arch=(x86_64 aarch64)
license=(AGPL-3.0-only)
provides=(trufflehog)
conflicts=("${provides[@]}")

_src="https://raw.githubusercontent.com/trufflesecurity/trufflehog/v$pkgver"
source=(
  "$_src/examples/generic.yml"
  "$_src/examples/generic_with_filters.yml"
)
source_x86_64=("$url/releases/download/v$pkgver/trufflehog_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/trufflehog_${pkgver}_linux_arm64.tar.gz")

sha256sums=('37e56a67543eea634967c9516831c823967fb2e2cbfedc036be25648f5d696d2'
            'b1dc9104998919f161e89aa8512699ed20b50c601cfbcebc4ba630e69cf3e62e')
sha256sums_x86_64=('aa2258dc4e76d93518730331e69ca01a638c365ab862a828c566e025f6c8150c')
sha256sums_aarch64=('f49e1e795b349198a026f6e56622eb227c73f8038edddc1c48d5e8c244bebe71')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 generic{,_with_filters}.yml -t "$pkgdir/usr/share/doc/$pkgname/examples/"

  install -Dm755 trufflehog -t "$pkgdir/usr/lib/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/trufflehog" <<EOF
#!/usr/bin/sh
exec /usr/lib/$pkgname/trufflehog --no-update "\$@"
EOF
}
