# Maintainer: someone5678 <someone5678 dot dev at google dot com>

pkgname=bpfmt-git
_pkgname=bpfmt
pkgver=20241213.r3403.cd60d79
pkgrel=1
pkgdesc='A tool for formatting AOSP soong blueprint build files'
url='https://android.googlesource.com/platform/build/blueprint'
arch=('any')
license=('Apache-2.0')
makedepends=('go')
provides=($_pkgname)
source=('git+https://android.googlesource.com/platform/build/blueprint')
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/blueprint"
	(
		set -o pipefail
		printf "%s.r%s.%s" \
		"$(git log -1 --date=format:%Y%m%d --format=%ad)" \
		"$(git rev-list --count HEAD)" \
		"$(git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
	)
}

build() {
  cd "$srcdir/blueprint/$_pkgname"
  go build
}

package() {
  install -Dm755 "$srcdir/blueprint/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/blueprint/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
