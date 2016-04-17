## Maintainer: benklett <b.klettbach@gmail.com>

pkgname=repo
# pkgver from https://android.googlesource.com/tools/repo/+/v1.12.33/repo
pkgver=1.22
pkgrel=1
pkgdesc="The Multiple Git Repository Tool from the Android Open Source Project"
arch=("i686" "x86_64")
url="http://source.android.com/source/git-repo.html"
license=("APACHE")
depends=("git" "python2")
makedepends=("git")
# source is always the current tag
source=(
  "git+https://android.googlesource.com/tools/repo.git#tag=v1.12.33"
  "python2-patch.diff"
)
sha256sums=(
  "SKIP"
  "26867df82596df8335af4b5710a97c95322439da955ec6cddbea781e44c88f0d"
)

build() {
  cd ${pkgname}
  # patching repo to use python2 instead of python3
  patch -p1 < "${srcdir}/python2-patch.diff"
}

package() {
  cd ${pkgname}
  install -D -m 755 repo "${pkgdir}/usr/bin/repo"
  install -D -m 644 docs/manifest-format.txt "${pkgdir}/usr/share/doc/${pkgname}/manifest-format.txt"
} 
