# Maintainer: tarball <bootctl@gmail.com>

pkgname=trufflehog-bin
pkgver=3.90.0
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
            'f01a5a32d359e07a30b56df2b8c5b303e398d9801c1c4e775c09912b42ca74e7')
sha256sums_x86_64=('74ee0b26af165699b6eb852d2f06f8fbf21070bf18184f97bd450ef27c4ce58b')
sha256sums_aarch64=('f0c7e02cdcc29dfe6a561a91f1f4df68de66a87ff17e1f04c5069da392a2e513')

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
