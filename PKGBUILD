# Maintainer: t3kk3n <corp [at] hush [dot] ai>

pkgname=backports-patches-git
pkgver=r9.e8ff5f4
pkgrel=1
pkgdesc="frag+ack, chan_qos_frag, and chan-neg-1 patches for backports-patched."
url='https://backports.wiki.kernel.org/index.php/Main_Page'
arch=('any')
license=('GPL')
source=('backports-patches-git::git+https://github.com/hellnet/backports-patches.git')
sha256sums='SKIP'

_p1="50-1-mac80211.compat08082009.wl_frag+ack_v1.patch"
_p2="60-1-compatdrivers_chan_qos_frag.patch"
_p3="70-1-fix-channel-negative-1.patch"

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -d "${pkgdir}"/etc/makepkg.d/backports-patched/patches
  install -m0644 "${srcdir}/${pkgname}/${_p1}" "${pkgdir}"/etc/makepkg.d/backports-patched/patches/${_p1}
  install -m0644 "${srcdir}/${pkgname}/${_p2}" "${pkgdir}"/etc/makepkg.d/backports-patched/patches/${_p2}
  install -m0644 "${srcdir}/${pkgname}/${_p3}" "${pkgdir}"/etc/makepkg.d/backports-patched/patches/${_p3}
}
