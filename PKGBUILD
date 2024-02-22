# Maintainer: Claudia Pellegrino <clau@tiqua.de>

pkgname=funiculi
pkgver=0.1.3
pkgrel=1
pkgdesc='Control your Denon AVR amplifier from the command line'
arch=('any')
url='https://github.com/claui/funiculi'
license=('Apache-2.0')
depends=(
  'nmap'
  'pulseaudio-dlna'
  'python-colorama'
  'python-fire'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/funiculi/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '0c90271a717d2c1304924fd9251b33e437731fa1c579d0830d0f30b8e5f5ec316a106ef27803bf26cc7db5bd773c8aa6a648a68f2487f7c9b7944eabc6a8e3d0'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
