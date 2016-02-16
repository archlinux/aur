# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=tails-installer
pkgver=4.4.7
pkgrel=2
pkgdesc="Installer for the Tails live operating system"
arch=('x86_64' 'i686')
url="https://tails.boum.org/"
license=(GPL)
depends=('cdrkit' 'coreutils' 'dosfstools' 'e2fsprogs' 'gptfdisk' 'gtk3' 'p7zip' 'python2-configobj' 'syslinux' 'udisks2' 'urlgrabber')
makedepends=('git')
source=(
  "git://git.tails.boum.org/liveusb-creator#tag=tails-installer_${pkgver}"
  "0001-syslinux-path.patch"
)
sha256sums=(
  'SKIP'
  '9f6d72212172e3f4275f953b4d3387b17fe8c4daac83d41a93d659d688f9ea27'
)
_pkgname=liveusb-creator

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 -i "${srcdir}/0001-syslinux-path.patch"
}

package() {
  cd "${srcdir}/${_pkgname}"
  sed -i '1!b;s/python/python2/' tails-installer{,-launcher}
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
