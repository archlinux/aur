# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=bugnano
_pkgname=fcd
pkgname=${_pkgname}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Text mode file manager combining the best features of ranger and mc'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('GPL-3.0-or-later ')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'f430f05dc210423c37b2363cd59d602eec12c427f20dbea619bdab561b2030a6'
            '32ead3ff60bbb0a80662df27871ccb24c74abe78e416745d3614805aa9174e06')
sha256sums_x86_64=('15a46965301691171a471d904dc28c98170b8e89ee8edd31793c31ec36394eac')

prepare() {
  cd "${srcdir}" || exit

  mv "LICENSE-${pkgver}" "./${_pkgname}/LICENSE"

  mv "README-${pkgver}.md" "./${_pkgname}/README.md"
  mv "CHANGELOG-${pkgver}.md" "./${_pkgname}/CHANGELOG.md"
}

package() {
  cd "${srcdir}/${_pkgname}" || exit

  install -D -m755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  install -D -m644 "${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
  install -D -m644 "${_pkgname}-view.1" "$pkgdir/usr/share/man/man1/${_pkgname}-view.1"

  install -D -m644 "${_pkgname}.sh" "$pkgdir/etc/profile.d/${_pkgname}.sh"
  install -D -m644 "${_pkgname}.fish" "$pkgdir/etc/fish/functions/${_pkgname}.fish"

  install -D -m644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -D -m644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"

  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
