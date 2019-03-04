# Maintainer: Maximilian Hill <arch.pkgs@maxhill.eu>

_pkgbase="nimiq"
pkgname=${_pkgbase}-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Nimiq core"
arch=('x86_64')
url="https://nimiq.com"
license=('Apache')
groups=('base-devel')
depends=(
  'nodejs'
  'npm'
)
_pkgrel=""
if [ ${pkgrel} -gt 0 ]
then
  _pkgrel="-${pkgrel}"
fi
source=(
  "https://repo.nimiq.com/rpm/stable/${arch}/nimiq-${pkgver}${_pkgrel}.${arch}.rpm"
  "${_pkgbase}.sysusers"
)
noextract=("${source[@]##*/}")
backup=(
  "etc/nimiq/nimiq.conf"
)
sha256sums=(
  'fc01ccb1ce46d8a155de3c84adcaef5cdd4c0db8581f9c4714be1d3b7c90e531'
  '8a24a02f92af8ed75b0405eefdd6b5ca33a91237e47111d93da0978df23720df'
)
install="${_pkgbase}.install"

package() {
  cd "${pkgdir}"

  #install sysusers.conf
  install -Dm644 "${srcdir}/${_pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
  bsdtar -xf "${srcdir}/nimiq-${pkgver}${_pkgrel}.${arch}.rpm"
  rm -rvf "usr/lib/.build-id"
  rm -rvf "etc/yum.repos.d"
  rm -rvf "etc/pki"
}
