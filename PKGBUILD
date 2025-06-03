# Contributor: fossdd <fossdd@tutanota.com>
pkgbase=vlang-coreutils-git
pkgname=($pkgbase) # ($pkgbase coreutils-vlang-git)
pkgver=r307.3f94d0a
pkgrel=1
url='https://github.com/vlang/coreutils'
license=(MIT)
arch=(x86_64)
makedepends=(vlang make)
source=("git+https://github.com/vlang/coreutils.git")
sha256sums=('SKIP')

pkgver() {
  cd coreutils
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  echo You may need to chmod -R 755 /usr/lib/vlang to build this.
  cd coreutils
  make
}

package_vlang-coreutils-git() {
  pkgdesc="vlang rewrite of coreutils (installed at /usr/lib/vlang-coreutils)"
  install -d "$pkgdir"/usr/lib
  cp -r --reflink=auto coreutils/bin "$pkgdir"/usr/lib/vlang-coreutils
}

#package_coreutils-vlang-git() {
#  pkgdesc="(Dangerous) Swap coreutils with vlang rewrite"
#  depends=($pkgbase uutils-coreutils nix-busybox)
#  conflicts=(coreutils{,-arch} b3sum sha3sum)
#  provides=(coreutils{,-arch} b3sum)
#  install -d "$pkgdir"/usr/bin
  # missing bins
#  for f in $(uu-coreutils --list)
#    do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/$f
#  done
#  ln -sf /usr/lib/nix/busybox "$pkgdir"/usr/bin/stty
  # avaiable bins
#  for f in $(ls coreutils/bin)
#    do ln -sf /usr/lib/vlang-coreutils/$f "$pkgdir"/usr/bin/$f
#  done
#  rm "$pkgdir"/usr/bin/{kill,more,uptime,hostname} # confliction
#}
