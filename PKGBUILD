# Maintainer: Christoph Haag <christoph.haag@collabora.com>
pkgname=chromium-post-build-ninja-summary-git
pkgver=20220214g54e30e704363e80a20bff934c6bf1f9d1f706d1c
pkgrel=1
pkgdesc="Summarize the last ninja build, with timings"
arch=('any')
url="https://chromium.googlesource.com/chromium/tools/depot_tools.git/+/refs/heads/main/post_build_ninja_summary.py"
license=('BSD')
depends=("python")
makedepends=("wget" "coreutils")
source=()

pkgver() {
	rm -f main
	wget 'https://chromium.googlesource.com/chromium/tools/depot_tools.git/+/refs/heads/main'
	echo "$(date +%Y%m%d)g$(grep -oP '(?<=commit</th><td>)[0-9a-z]*' main)"
}

build() {
	wget 'https://chromium.googlesource.com/chromium/tools/depot_tools.git/+/refs/heads/main/post_build_ninja_summary.py?format=TEXT' -O - | base64 -d > post_build_ninja_summary.py
}

package() {
	install -d "$pkgdir"/usr/bin
	install -m755 post_build_ninja_summary.py "$pkgdir"//usr/bin
}
