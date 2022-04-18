# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andrew DeMaria <lostonamountain@gmail.com>

set -u
_pkgname='foolsm'
pkgname='lsm'
pkgver='1.0.21'
pkgrel='1'
pkgdesc="a Link Status Monitor which can be used to monitor for example a Linux router/firewall connectivity ${_pkgname}"
arch=('i686' 'x86_64')
url='https://lsm.foobar.fi/'
license=('GPL2')
_verwatch=("${url}/download/" "${_pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
source=("${url}/download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('45a2abd175ff6e7c1d93ad2caae7c47e')
sha256sums=('527d9c363aa62b9fc511b42c5a06f774a8767c4b5330db4d959c10b46b0dede7')

build() {
  set -u
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dpm0644 "${_pkgname}.conf" -t "${pkgdir}/etc/${_pkgname}"
  install -Dpm0755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dpm0644 'README' "${_pkgname}.conf.sample" 'default_script.sample' "rsyslog-${_pkgname}.conf.sample" -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dpm0755 'default_script' 'shorewall_script' -t "${pkgdir}/usr/share/${_pkgname}"
  install -d "${pkgdir}/var/lib/${_pkgname}"
  set +u
}
set +u
