# Maintainer: JGH <jghodd(at)gmail(dot)com>

_pkgbase=uvesafb
pkgname=uvesafb-dkms
pkgver=1.0.0
pkgrel=3
_v86d=v86d
_v86dver=0.1.10
pkgdesc="uvesafb dkms driver and userspace helper for uvesafb that runs x86 code in an emulated environment"
arch=('i686' 'x86_64')
url="https://github.com/jghodd/uvesafb-dkms"
license=('GPL2')
depends=('glibc' 'dkms>=2.2.0.3+git151023-5' 'v86d')
makedepends=('git')
options=('!makeflags')

source=("git://github.com/jghodd/uvesafb-dkms.git#tag=$pkgname-$pkgver"
        'dkms.conf')

md5sums=(SKIP
         '39fa4b6d261d4fb44d21f45dc8a5390c')

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${pkgname}/src ${pkgname}/Makefile \
        "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
