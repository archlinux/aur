# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>

_name_upper='Beekeeper Studio'
_pkgname='beekeeper-studio'
pkgname="${_pkgname}-bin"
pkgver=1.7.5
pkgrel=1
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64')
url='https://www.beekeeperstudio.io'
_url_source='https://github.com/beekeeper-studio/beekeeper-studio'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "${_pkgname}-${pkgver}-LICENSE::${_url_source}/raw/master/LICENSE.md")
# NB: updpkgsums: LICENSE == SKIP
sha256sums=('13da76eb871a549ef8876681351f1a9edec7460d5152bbda68b5e49cf6430638'
            '787ebc78ce29cd0cea3e52651936df7fef96b117782882fce389c3b7ce5683f5')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${_name_upper}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" \
    "${pkgdir}/opt/${_name_upper}/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
