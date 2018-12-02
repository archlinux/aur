# Maintainer: Maximilian Hill <arch.pkgs@maxhill.eu>

_pkgbase="nimiq"
pkgname=${_pkgbase}-bin
pkgver=1.4.0
_orig_pkgrel=1
pkgrel=2
pkgdesc="Nimiq core"
arch=('x86_64')
url="https://nimiq.com"
license=('Apache')
groups=('base-devel')
depends=(
  'nodejs'
  'npm'
)
source=(
  "https://repo.nimiq.com/rpm/stable/${arch}/nimiq-${pkgver}-${_orig_pkgrel}.${arch}.rpm"
  "${_pkgbase}.sysusers"
)
noextract=("${source[@]##*/}")
backup=(
  "etc/nimiq/nimiq.conf"
)
sha256sums=(
  '26dcfb2f6299a274f812dae1576b926acb04336e7dada7d8571ece93d8668cff'
  'bcccf6e33e8c5f73342a1a73422f48269af1f332a3151cec9c304b05dec74303'
)
install="${_pkgbase}.install"

package() {
  cd "${pkgdir}"

  #install sysusers.conf
  install -Dm644 "${srcdir}/${_pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
  bsdtar -xvf "${srcdir}/nimiq-${pkgver}-${_orig_pkgrel}.${arch}.rpm"
  rm -rvf "usr/lib/.build-id"
  rm -rvf "etc/yum.repos.d"
  rm -rvf "etc/pki"
}
